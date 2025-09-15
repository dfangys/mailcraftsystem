import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:mailcraftsystem/features/account/domain/models/mail_account_config.dart';

/// Local storage service for mail accounts
class AccountLocalStorage {
  AccountLocalStorage({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();
  
  final FlutterSecureStorage _storage;
  
  static const String _accountsKey = 'mail_accounts';
  static const String _defaultAccountKey = 'default_account_id';
  
  /// Get all stored accounts
  Future<List<MailAccountConfig>> getAccounts() async {
    final accountsJson = await _storage.read(key: _accountsKey);
    if (accountsJson == null) return [];
    
    try {
      final accountsList = jsonDecode(accountsJson) as List<dynamic>;
      return accountsList
          .map((json) => MailAccountConfig.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // If data is corrupted, return empty list
      await _storage.delete(key: _accountsKey);
      return [];
    }
  }
  
  /// Get account by ID
  Future<MailAccountConfig?> getAccount(String id) async {
    final accounts = await getAccounts();
    try {
      return accounts.firstWhere((account) => account.id == id);
    } catch (e) {
      return null;
    }
  }
  
  /// Save accounts list
  Future<void> saveAccounts(List<MailAccountConfig> accounts) async {
    final accountsJson = jsonEncode(
      accounts.map((account) => account.toJson()).toList(),
    );
    await _storage.write(key: _accountsKey, value: accountsJson);
  }
  
  /// Add new account
  Future<void> addAccount(MailAccountConfig account) async {
    final accounts = await getAccounts();
    accounts.add(account);
    await saveAccounts(accounts);
  }
  
  /// Update existing account
  Future<bool> updateAccount(MailAccountConfig updatedAccount) async {
    final accounts = await getAccounts();
    final index = accounts.indexWhere((account) => account.id == updatedAccount.id);
    
    if (index == -1) return false;
    
    accounts[index] = updatedAccount;
    await saveAccounts(accounts);
    return true;
  }
  
  /// Delete account
  Future<bool> deleteAccount(String id) async {
    final accounts = await getAccounts();
    final initialLength = accounts.length;
    
    accounts.removeWhere((account) => account.id == id);
    
    if (accounts.length < initialLength) {
      await saveAccounts(accounts);
      
      // Clear default account if it was deleted
      final defaultAccountId = await getDefaultAccountId();
      if (defaultAccountId == id) {
        await clearDefaultAccount();
      }
      
      return true;
    }
    
    return false;
  }
  
  /// Set default account ID
  Future<void> setDefaultAccountId(String accountId) async {
    await _storage.write(key: _defaultAccountKey, value: accountId);
  }
  
  /// Get default account ID
  Future<String?> getDefaultAccountId() async {
    return await _storage.read(key: _defaultAccountKey);
  }
  
  /// Get default account
  Future<MailAccountConfig?> getDefaultAccount() async {
    final defaultId = await getDefaultAccountId();
    if (defaultId == null) return null;
    
    return await getAccount(defaultId);
  }
  
  /// Clear default account
  Future<void> clearDefaultAccount() async {
    await _storage.delete(key: _defaultAccountKey);
  }
  
  /// Check if account exists
  Future<bool> accountExists(String id) async {
    final account = await getAccount(id);
    return account != null;
  }
  
  /// Get accounts count
  Future<int> getAccountsCount() async {
    final accounts = await getAccounts();
    return accounts.length;
  }
  
  /// Clear all accounts
  Future<void> clearAllAccounts() async {
    await _storage.delete(key: _accountsKey);
    await _storage.delete(key: _defaultAccountKey);
  }
  
  /// Get active accounts only
  Future<List<MailAccountConfig>> getActiveAccounts() async {
    final accounts = await getAccounts();
    return accounts.where((account) => account.isActive).toList();
  }
  
  /// Deactivate account
  Future<bool> deactivateAccount(String id) async {
    final account = await getAccount(id);
    if (account == null) return false;
    
    final updatedAccount = account.copyWith(isActive: false);
    return await updateAccount(updatedAccount);
  }
  
  /// Activate account
  Future<bool> activateAccount(String id) async {
    final account = await getAccount(id);
    if (account == null) return false;
    
    final updatedAccount = account.copyWith(isActive: true);
    return await updateAccount(updatedAccount);
  }
}
