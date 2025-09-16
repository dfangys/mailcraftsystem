import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mailcraftsystem/features/navigation/presentation/widgets/app_drawer.dart';
import 'package:mailcraftsystem/features/auth/presentation/controllers/auth_controller.dart';
import 'package:mailcraftsystem/shared/widgets/app_card.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message.dart';
import 'package:mailcraftsystem/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:mailcraftsystem/shared/widgets/app_button.dart';

/// Enterprise-grade dashboard screen with comprehensive overview
class DashboardScreen extends ConsumerStatefulWidget {
  /// Creates a dashboard screen
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  bool _loaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loaded) {
      _loaded = true;
      final authState = ref.read(authControllerProvider);
      final email = authState.userEmail ?? authState.user?.email;
      if (email != null && email.isNotEmpty) {
        // Load dashboard data
        ref.read(dashboardControllerProvider.notifier).load(email);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authState = ref.watch(authControllerProvider);
    final dashState = ref.watch(dashboardControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => _showNotifications(context),
            tooltip: 'Notifications',
          ),
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () => context.push('/search'),
            tooltip: 'Search',
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert_outlined),
            onSelected: (value) => _handleMenuAction(context, value),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'refresh',
                child: ListTile(
                  leading: Icon(Icons.refresh_outlined),
                  title: Text('Refresh'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuItem(
                value: 'settings',
                child: ListTile(
                  leading: Icon(Icons.settings_outlined),
                  title: Text('Settings'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshDashboard(ref),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome section
              _WelcomeSection(
                userName: authState.user?.name ?? 'User',
                userEmail: authState.user?.email ?? 'user@example.com',
              ),

              const SizedBox(height: 24),

// Account overview
              _buildSectionHeader(context, 'Account Overview'),
              const SizedBox(height: 12),
              _AccountOverviewCard(
                name: dashState.displayName ?? (authState.user?.name ?? 'User'),
                email: dashState.email ?? (authState.user?.email ?? '—'),
                secondaryEmail: dashState.secondaryEmail,
                phoneNumber: dashState.phoneNumber,
                usageLabel: dashState.usageLabel,
                quotaLabel: dashState.quotaLabel,
                usagePercent: dashState.usagePercent,
                twoFactorEnabled: dashState.twoFactorEnabled,
                onToggle2FA: (value) => ref.read(dashboardControllerProvider.notifier).toggleTwoFactor(value),
              ),

              const SizedBox(height: 24),

              // Email statistics
              _buildSectionHeader(context, 'Email Overview'),
              const SizedBox(height: 12),
              _EmailStatsGrid(
                unread: dashState.unreadCount,
                today: dashState.todayCount,
                drafts: dashState.draftsCount,
                sent: dashState.sentCount,
                isLoading: dashState.isLoading,
              ),

              const SizedBox(height: 24),

              // Quick actions
              _buildSectionHeader(context, 'Quick Actions'),
              const SizedBox(height: 12),
              _QuickActionsGrid(),

              const SizedBox(height: 24),

              // Recent activity
              _buildSectionHeader(context, 'Recent Activity'),
              const SizedBox(height: 12),
              _RecentActivityList(messages: dashState.recentMessages, isLoading: dashState.isLoading),

              const SizedBox(height: 24),

              // System status
              _buildSectionHeader(context, 'System Status'),
              const SizedBox(height: 12),
              _SystemStatusCard(),

              const SizedBox(height: 24),

              // Enterprise features
              _buildSectionHeader(context, 'Enterprise Features'),
              const SizedBox(height: 12),
              _EnterpriseFeaturesCard(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/compose'),
        icon: const Icon(Icons.edit_outlined),
        label: const Text('Compose'),
        tooltip: 'Compose new email',
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  void _showNotifications(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Notifications'),
        content: const Text('No new notifications'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _handleMenuAction(BuildContext context, String action) {
    switch (action) {
      case 'refresh':
        // Refresh dashboard
        break;
      case 'settings':
        context.push('/settings');
        break;
    }
  }

  Future<void> _refreshDashboard(WidgetRef ref) async {
    // Simulate refresh
    await Future.delayed(const Duration(seconds: 1));
  }
}

/// Welcome section with user greeting and quick info
class _WelcomeSection extends StatelessWidget {
  const _WelcomeSection({
    required this.userName,
    required this.userEmail,
  });

  final String userName;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final now = DateTime.now();
    final hour = now.hour;

    String greeting;
    if (hour < 12) {
      greeting = 'Good morning';
    } else if (hour < 17) {
      greeting = 'Good afternoon';
    } else {
      greeting = 'Good evening';
    }

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: colorScheme.primaryContainer,
                child: Icon(
                  Icons.person_outline,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$greeting, $userName!',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      userEmail,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Online',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Welcome to your MailCraft dashboard. Here you can manage your emails, view statistics, and access enterprise features.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

/// Grid of email statistics cards
class _EmailStatsGrid extends StatelessWidget {
  const _EmailStatsGrid({
    required this.unread,
    required this.today,
    required this.drafts,
    required this.sent,
    required this.isLoading,
  });

  final int unread;
  final int today;
  final int drafts;
  final int sent;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    String fmt(int n) => isLoading ? '—' : n.toString();

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.5,
      children: [
        StatCard(
          title: 'Unread',
          value: fmt(unread),
          icon: Icons.mark_email_unread_outlined,
          color: Colors.blue,
          onTap: () {},
        ),
        StatCard(
          title: 'Today',
          value: fmt(today),
          icon: Icons.today_outlined,
          color: Colors.green,
          onTap: () {},
        ),
        StatCard(
          title: 'Drafts',
          value: fmt(drafts),
          icon: Icons.drafts_outlined,
          color: Colors.orange,
          onTap: () {},
        ),
        StatCard(
          title: 'Sent',
          value: fmt(sent),
          icon: Icons.send_outlined,
          color: Colors.purple,
          onTap: () {},
        ),
      ],
    );
  }
}

/// Grid of quick action cards
class _QuickActionsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.0,
      children: [
        ActionCard(
          title: 'Compose',
          icon: Icons.edit_outlined,
          onTap: () => context.push('/compose'),
        ),
        ActionCard(
          title: 'Inbox',
          icon: Icons.inbox_outlined,
          onTap: () => context.push('/home'),
        ),
        ActionCard(
          title: 'Search',
          icon: Icons.search_outlined,
          onTap: () => context.push('/search'),
        ),
        ActionCard(
          title: 'Mailboxes',
          icon: Icons.folder_outlined,
          onTap: () => context.push('/mailbox'),
        ),
        ActionCard(
          title: 'Settings',
          icon: Icons.settings_outlined,
          onTap: () => context.push('/settings'),
        ),
        ActionCard(
          title: 'Enterprise',
          icon: Icons.business_outlined,
          onTap: () => context.push('/enterprise'),
        ),
      ],
    );
  }
}

class _AccountOverviewCard extends StatelessWidget {
  const _AccountOverviewCard({
    required this.name,
    required this.email,
    this.secondaryEmail,
    this.phoneNumber,
    this.usageLabel,
    this.quotaLabel,
    this.usagePercent,
    this.twoFactorEnabled,
    required this.onToggle2FA,
  });

  final String name;
  final String email;
  final String? secondaryEmail;
  final String? phoneNumber;
  final String? usageLabel;
  final String? quotaLabel;
  final double? usagePercent; // 0..1 per API
  final bool? twoFactorEnabled;
  final ValueChanged<bool> onToggle2FA;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    double progress = (usagePercent ?? 0.0);
    if (progress > 1.0) {
      // If API actually returns percent in 0..100
      progress = progress / 100.0;
    }

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: colorScheme.primaryContainer,
                child: Icon(Icons.person_outline, color: colorScheme.onPrimaryContainer),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                    Text(email, style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
                    if (secondaryEmail != null && secondaryEmail!.isNotEmpty)
                      Text(secondaryEmail!, style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                    if (phoneNumber != null && phoneNumber!.isNotEmpty)
                      Text('Phone: $phoneNumber', style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Storage
          if (usageLabel != null || quotaLabel != null) ...[
            Text('Storage', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: progress.clamp(0.0, 1.0)),
            const SizedBox(height: 4),
            Text(
              [if (usageLabel != null) usageLabel!, if (quotaLabel != null) 'of $quotaLabel'].join(' '),
              style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ],
          const SizedBox(height: 12),
          // 2FA
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Two-factor authentication', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
              Switch(
                value: twoFactorEnabled ?? false,
                onChanged: onToggle2FA,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Recent activity list
String _formatRelative(DateTime? date) {
  if (date == null) return '';
  final now = DateTime.now();
  final diff = now.difference(date);
  if (diff.inMinutes < 1) return 'Just now';
  if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
  if (diff.inHours < 24) return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago';
  return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago';
}

class _RecentActivityList extends StatelessWidget {
  const _RecentActivityList({required this.messages, required this.isLoading});

  final List<Message> messages;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (isLoading) {
      return const AppCard(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    List<_ActivityItem> activities = messages.map((m) {
      final from = m.from?.displayName ?? 'Unknown sender';
      final subject = m.subject ?? '(No subject)';
      return _ActivityItem(
        icon: Icons.mail_outline,
        title: 'New email from $from',
        subtitle: subject,
        time: _formatRelative(m.date),
        color: Colors.blue,
      );
    }).toList();

    if (activities.isEmpty) {
      return const AppCard(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: Text('No recent activity')),
        ),
      );
    }

    return AppCard(
      child: Column(
        children: activities
            .map((activity) => _ActivityListTile(activity: activity))
            .toList(),
      ),
    );
  }
}

/// Activity item data class
class _ActivityItem {
  const _ActivityItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  final Color color;
}

/// Activity list tile widget
class _ActivityListTile extends StatelessWidget {
  const _ActivityListTile({required this.activity});

  final _ActivityItem activity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: activity.color.withOpacity(0.1),
        child: Icon(
          activity.icon,
          color: activity.color,
          size: 20,
        ),
      ),
      title: Text(
        activity.title,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        activity.subtitle,
        style: theme.textTheme.bodySmall?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: Text(
        activity.time,
        style: theme.textTheme.bodySmall?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}

/// System status card
class _SystemStatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.health_and_safety_outlined,
                color: Colors.green,
              ),
              const SizedBox(width: 12),
              Text(
                'All Systems Operational',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.green.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _StatusItem(
            label: 'Email Service',
            status: 'Online',
            color: Colors.green,
          ),
          _StatusItem(
            label: 'Sync Service',
            status: 'Active',
            color: Colors.green,
          ),
          _StatusItem(
            label: 'Security',
            status: 'Protected',
            color: Colors.green,
          ),
          _StatusItem(
            label: 'Last Backup',
            status: '2 hours ago',
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

/// Status item widget
class _StatusItem extends StatelessWidget {
  const _StatusItem({
    required this.label,
    required this.status,
    required this.color,
  });

  final String label;
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodyMedium,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Enterprise features card
class _EnterpriseFeaturesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.business_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 12),
              Text(
                'Enterprise Features',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Access advanced security, analytics, and management tools designed for enterprise environments.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 16),
          AppButton(
            text: 'Explore Features',
            icon: Icons.arrow_forward_outlined,
            onPressed: () => context.go('/enterprise'),
            style: AppButtonStyle.primary,
          ),
        ],
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  const ActionCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppCard(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  const StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.onTap,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppCard(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: color,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
