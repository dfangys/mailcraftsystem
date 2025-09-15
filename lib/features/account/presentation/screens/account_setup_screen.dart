import '../../../../core/error/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../shared/widgets/loading_widget.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/forms/app_text_field.dart';
import '../controllers/account_controller.dart';
import '../widgets/provider_preset_card.dart';
import '../widgets/advanced_settings_panel.dart';
import '../../../../core/error/failures.dart' as core;

/// Account setup screen with IMAP/SMTP configuration
class AccountSetupScreen extends ConsumerStatefulWidget {
  /// Creates an account setup screen
  const AccountSetupScreen({super.key});

  @override
  ConsumerState<AccountSetupScreen> createState() => _AccountSetupScreenState();
}

class _AccountSetupScreenState extends ConsumerState<AccountSetupScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _pageController = PageController();
  
  // Form controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _displayNameController = TextEditingController();
  
  // Manual setup controllers
  final _imapHostController = TextEditingController();
  final _imapPortController = TextEditingController();
  final _smtpHostController = TextEditingController();
  final _smtpPortController = TextEditingController();
  
  late TabController _tabController;
  int _currentStep = 0;
  bool _showAdvancedSettings = false;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _displayNameController.dispose();
    _imapHostController.dispose();
    _imapPortController.dispose();
    _smtpHostController.dispose();
    _smtpPortController.dispose();
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _handleProviderSelected(String providerId) {
    ref.read(accountControllerProvider.notifier).selectProvider(providerId);
    _nextStep();
  }

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleAccountSetup() {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(accountControllerProvider.notifier).setupAccount(
            email: _emailController.text.trim(),
            password: _passwordController.text,
            displayName: _displayNameController.text.trim(),
            imapHost: _imapHostController.text.trim(),
            imapPort: int.tryParse(_imapPortController.text) ?? 993,
            smtpHost: _smtpHostController.text.trim(),
            smtpPort: int.tryParse(_smtpPortController.text) ?? 587,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final accountState = ref.watch(accountControllerProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Listen for navigation events
    ref.listen<AccountState>(accountControllerProvider, (previous, next) {
      if (next.isSetupComplete) {
        context.go('/home');
      }
    });

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
                leading: _currentStep > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _previousStep,
              )
            : IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => context.go('/login'),
              ),
        title: Text(
          'Account Setup',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Progress indicator
          _buildProgressIndicator(),
          
          // Content
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildProviderSelectionStep(),
                _buildAccountDetailsStep(),
                _buildVerificationStep(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: List.generate(3, (index) {
          final isActive = index <= _currentStep;
          final isCompleted = index < _currentStep;

          return Expanded(
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: isActive
                        ? colorScheme.primary
                        : colorScheme.surfaceVariant,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: isCompleted
                        ? Icon(
                            Icons.check,
                            size: 16,
                            color: colorScheme.onPrimary,
                          )
                        : Text(
                            '${index + 1}',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: isActive
                                  ? colorScheme.onPrimary
                                  : colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                if (index < 2)
                  Expanded(
                    child: Container(
                      height: 2,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      color: isCompleted
                          ? colorScheme.primary
                          : colorScheme.surfaceVariant,
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildProviderSelectionStep() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Text(
            'Choose Your Email Provider',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Select your email provider or configure manually',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Provider presets
          ProviderPresetCard(
            providerId: 'gmail',
            name: 'Gmail',
            description: 'Google Gmail accounts',
            icon: Icons.email,
            onTap: () => _handleProviderSelected('gmail'),
          ),
          const SizedBox(height: 16),
          
          ProviderPresetCard(
            providerId: 'outlook',
            name: 'Outlook',
            description: 'Microsoft Outlook/Hotmail accounts',
            icon: Icons.email,
            onTap: () => _handleProviderSelected('outlook'),
          ),
          const SizedBox(height: 16),
          
          ProviderPresetCard(
            providerId: 'yahoo',
            name: 'Yahoo Mail',
            description: 'Yahoo email accounts',
            icon: Icons.email,
            onTap: () => _handleProviderSelected('yahoo'),
          ),
          const SizedBox(height: 16),
          
          ProviderPresetCard(
            providerId: 'wahda',
            name: 'Wahda Bank',
            description: 'Wahda Bank email accounts',
            icon: Icons.email,
            onTap: () => _handleProviderSelected('wahda'),
          ),
          const SizedBox(height: 32),

          // Manual setup option
          OutlinedButton.icon(
            onPressed: () => _handleProviderSelected('manual'),
            icon: const Icon(Icons.settings),
            label: const Text('Manual Configuration'),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountDetailsStep() {
    final accountState = ref.watch(accountControllerProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Text(
              'Account Details',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Enter your email credentials',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Error display
            if (accountState.error != null) ...[
              AppErrorWidget(
                failure: Failure.validation(message: accountState.error!),
                onRetry: _handleAccountSetup,
              ),
              const SizedBox(height: 24),
            ],

            // Display name
            AppTextField(
              controller: _displayNameController,
              label: 'Display Name',
              hintText: 'Your name',
              prefixIcon: const Icon(Icons.person),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter your display name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Email
            AppTextField(
              controller: _emailController,
              label: 'Email Address',
              hintText: 'your.email@example.com',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter your email address';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value!)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              onChanged: (value) {
                // Auto-fill server settings based on email domain
                ref.read(accountControllerProvider.notifier)
                    .updateEmailAndDetectProvider(value);
              },
            ),
            const SizedBox(height: 16),

            // Password
            AppTextField(
              controller: _passwordController,
              label: 'Password',
              hintText: 'Your email password',
              obscureText: _obscurePassword,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // Advanced settings toggle
            if (accountState.selectedProvider == 'manual') ...[
              Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 20,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Server Settings',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Manual server configuration
              _buildManualServerSettings(),
              const SizedBox(height: 24),
            ] else ...[
              ExpansionTile(
                leading: const Icon(Icons.settings),
                title: const Text('Advanced Settings'),
                subtitle: const Text('Server configuration and security options'),
                children: [
                  _buildManualServerSettings(),
                  const SizedBox(height: 16),
                  AdvancedSettingsPanel(
                    onSettingsChanged: (settings) {
                      ref.read(accountControllerProvider.notifier)
                          .updateAdvancedSettings(settings);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],

            // Continue button
            FilledButton(
              onPressed: accountState.isLoading ? null : _handleAccountSetup,
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: accountState.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Test Connection'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildManualServerSettings() {
    return Column(
      children: [
        // IMAP Settings
        Row(
          children: [
            Expanded(
              flex: 2,
              child: AppTextField(
                controller: _imapHostController,
                label: 'IMAP Server',
                hintText: 'imap.example.com',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AppTextField(
                controller: _imapPortController,
                label: 'Port',
                hintText: '993',
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        
        // SMTP Settings
        Row(
          children: [
            Expanded(
              flex: 2,
              child: AppTextField(
                controller: _smtpHostController,
                label: 'SMTP Server',
                hintText: 'smtp.example.com',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AppTextField(
                controller: _smtpPortController,
                label: 'Port',
                hintText: '587',
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVerificationStep() {
    final accountState = ref.watch(accountControllerProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Status icon
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: accountState.isConnected
                  ? colorScheme.primaryContainer
                  : colorScheme.errorContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              accountState.isConnected
                  ? Icons.settings
                  : Icons.settings,
              size: 48,
              color: accountState.isConnected
                  ? colorScheme.primary
                  : colorScheme.error,
            ),
          ),
          const SizedBox(height: 24),

          // Status text
          Text(
            accountState.isConnected
                ? 'Connection Successful!'
                : 'Connection Failed',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: accountState.isConnected
                  ? colorScheme.primary
                  : colorScheme.error,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          if (accountState.isConnected) ...[
            Text(
              'Your email account has been configured successfully.',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            
            // Connection details
            if (accountState.connectionDetails != null) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceVariant.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Connection Details',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...accountState.connectionDetails!.entries.map(
                      (entry) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            Text(
                              '${entry.key}: ',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            Text(
                              entry.value,
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],

            FilledButton(
              onPressed: () => context.go('/home'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Continue to Inbox'),
            ),
          ] else ...[
            Text(
              accountState.error ?? 'Unable to connect to the email server.',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: colorScheme.error,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            
            OutlinedButton(
              onPressed: _previousStep,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Try Again'),
            ),
          ],
        ],
      ),
    );
  }
}
