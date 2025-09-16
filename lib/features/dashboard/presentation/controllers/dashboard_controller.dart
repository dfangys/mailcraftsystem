import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/mailboxes/domain/models/mailbox.dart' as mailbox_model;
import 'package:mailcraftsystem/features/mailboxes/domain/repositories/mailbox_repository.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message.dart';
import 'package:mailcraftsystem/features/messages/domain/repositories/message_repository.dart';
import 'package:mailcraftsystem/features/auth/domain/repositories/auth_repository.dart';
import 'package:mailcraftsystem/features/auth/data/datasources/auth_api_client.dart';

class DashboardState {
  const DashboardState({
    this.isLoading = true,
    this.error,
    this.unreadCount = 0,
    this.todayCount = 0,
    this.draftsCount = 0,
    this.sentCount = 0,
    this.recentMessages = const <Message>[],
    this.displayName,
    this.email,
    this.secondaryEmail,
    this.phoneNumber,
    this.usageLabel,
    this.quotaLabel,
    this.usagePercent,
    this.twoFactorEnabled,
    this.otpDelivery,
  });

  final bool isLoading;
  final String? error;
  final int unreadCount;
  final int todayCount;
  final int draftsCount;
  final int sentCount;
  final List<Message> recentMessages;

  // Profile
  final String? displayName;
  final String? email;
  final String? secondaryEmail;
  final String? phoneNumber;
  final String? usageLabel;
  final String? quotaLabel;
  final double? usagePercent; // 0..100 or 0..1? API says percent=0.1 (assume percent value)
  final bool? twoFactorEnabled;
  final String? otpDelivery;

  DashboardState copyWith({
    bool? isLoading,
    String? error,
    int? unreadCount,
    int? todayCount,
    int? draftsCount,
    int? sentCount,
    List<Message>? recentMessages,
    String? displayName,
    String? email,
    String? secondaryEmail,
    String? phoneNumber,
    String? usageLabel,
    String? quotaLabel,
    double? usagePercent,
    bool? twoFactorEnabled,
    String? otpDelivery,
  }) {
    return DashboardState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      unreadCount: unreadCount ?? this.unreadCount,
      todayCount: todayCount ?? this.todayCount,
      draftsCount: draftsCount ?? this.draftsCount,
      sentCount: sentCount ?? this.sentCount,
      recentMessages: recentMessages ?? this.recentMessages,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      secondaryEmail: secondaryEmail ?? this.secondaryEmail,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      usageLabel: usageLabel ?? this.usageLabel,
      quotaLabel: quotaLabel ?? this.quotaLabel,
      usagePercent: usagePercent ?? this.usagePercent,
      twoFactorEnabled: twoFactorEnabled ?? this.twoFactorEnabled,
      otpDelivery: otpDelivery ?? this.otpDelivery,
    );
  }
}

class DashboardController extends StateNotifier<DashboardState> {
  DashboardController(this._mailboxRepository, this._messageRepository, this._authRepository)
      : super(const DashboardState());

  final MailboxRepository _mailboxRepository;
  final MessageRepository _messageRepository;
  final AuthRepository _authRepository;

  Future<void> load(String accountId) async {
    state = state.copyWith(isLoading: true, error: null);

    // 1) Load all mailboxes to find canonical paths
    final mailboxesRes = await _mailboxRepository.getMailboxes(accountId);
    List<mailbox_model.Mailbox> mailboxes = [];
    mailboxesRes.fold(
      (l) => mailboxes = [],
      (r) => mailboxes = r,
    );

    String inboxPath = _findMailboxPath(mailboxes, mailbox_model.MailboxType.inbox) ?? 'INBOX';
    String sentPath = _findMailboxPath(mailboxes, mailbox_model.MailboxType.sent) ?? 'Sent';
    String draftsPath = _findMailboxPath(mailboxes, mailbox_model.MailboxType.drafts) ?? 'Drafts';

    // 2) Fetch mailbox statuses (unread/drafts/sent)
    final inboxStatusF = _mailboxRepository.getMailboxStatus(accountId, inboxPath);
    final draftsStatusF = _mailboxRepository.getMailboxStatus(accountId, draftsPath);
    final sentStatusF = _mailboxRepository.getMailboxStatus(accountId, sentPath);

    final results = await Future.wait([inboxStatusF, draftsStatusF, sentStatusF]);

    int unread = 0;
    int draftsCount = 0;
    int sentCount = 0;

    results[0].fold((_) {}, (status) => unread = status.unreadCount);
    results[1].fold((_) {}, (status) => draftsCount = status.messageCount);
    results[2].fold((_) {}, (status) => sentCount = status.messageCount);

    // 3) Fetch recent INBOX messages and compute today's count
    final inboxMsgsRes = await _messageRepository.getMessages(
      accountId,
      inboxPath,
      limit: 50,
    );

    List<Message> recent = [];
    int todayCount = 0;
    inboxMsgsRes.fold(
      (Failure l) {
        // Keep defaults
      },
      (List<Message> msgs) {
        final now = DateTime.now();
        final todayStart = DateTime(now.year, now.month, now.day);
        todayCount = msgs.where((m) => (m.date ?? DateTime.fromMillisecondsSinceEpoch(0)).isAfter(todayStart)).length;
        msgs.sort((a, b) => (b.date ?? DateTime.fromMillisecondsSinceEpoch(0))
            .compareTo(a.date ?? DateTime.fromMillisecondsSinceEpoch(0)));
        recent = msgs.take(5).toList();
      },
    );

    state = state.copyWith(
      isLoading: false,
      unreadCount: unread,
      draftsCount: draftsCount,
      sentCount: sentCount,
      todayCount: todayCount,
      recentMessages: recent,
    );

    // 4) Load profile usage/quota and 2FA status
    await _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      final token = await _authRepository.getStoredToken();
      if (token == null) return;
      final api = AuthApiClient();
      final resp = await api.getUserProfile(token.accessToken);
      final data = (resp['data'] ?? {}) as Map<String, dynamic>;
      final usage = (data['usage'] ?? {}) as Map<String, dynamic>;
      final quota = (data['quota'] ?? {}) as Map<String, dynamic>;
      final percent = (usage['percent'] as num?)?.toDouble();
      state = state.copyWith(
        displayName: data['name'] as String?,
        email: data['email'] as String?,
        secondaryEmail: data['secondary_email'] as String?,
        phoneNumber: data['phone_number'] as String?,
        usageLabel: usage['label'] as String?,
        quotaLabel: quota['label'] as String?,
        usagePercent: percent, // API gives percent, e.g., 0.1 => 10%
        twoFactorEnabled: data['two_factor_enabled'] as bool?,
        otpDelivery: data['otp_delivery'] as String?,
      );
    } catch (e) {
      // Ignore profile errors, keep dashboard otherwise
    }
  }

  Future<void> toggleTwoFactor(bool enabled) async {
    try {
      final token = await _authRepository.getStoredToken();
      if (token == null) return;
      final api = AuthApiClient();
      await api.toggleTwoFactor(enabled, token.accessToken);
      state = state.copyWith(twoFactorEnabled: enabled);
    } catch (e) {
      // Optionally revert UI or surface error
    }
  }

  String? _findMailboxPath(
    List<mailbox_model.Mailbox> boxes,
    mailbox_model.MailboxType type,
  ) {
    try {
      return boxes.firstWhere((b) => b.type == type).path;
    } catch (_) {
      return null;
    }
  }
}