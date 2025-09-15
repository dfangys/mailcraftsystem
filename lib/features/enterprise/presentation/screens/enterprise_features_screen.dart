import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailcraftsystem/shared/widgets/app_card.dart';

/// Enterprise-grade screen for managing enterprise features
class EnterpriseFeaturesScreen extends ConsumerWidget {
  /// Creates an enterprise features screen
  const EnterpriseFeaturesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Enterprise Features',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(context),
            const SizedBox(height: 24),

            // Security Features
            _buildSectionHeader(context, 'Security'),
            const SizedBox(height: 12),
            AppCard(
              child: Column(
                children: [
                  _buildFeatureTile(
                    context,
                    icon: Icons.security_outlined,
                    title: 'Data Loss Prevention (DLP)',
                    subtitle: 'Prevent sensitive data from being shared',
                    onTap: () {},
                  ),
                  _buildFeatureTile(
                    context,
                    icon: Icons.enhanced_encryption_outlined,
                    title: 'End-to-End Encryption',
                    subtitle: 'Ensure message content is always protected',
                    onTap: () {},
                  ),
                  _buildFeatureTile(
                    context,
                    icon: Icons.phishing_outlined,
                    title: 'Advanced Phishing Protection',
                    subtitle: 'Detect and block sophisticated phishing attacks',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Compliance Features
            _buildSectionHeader(context, 'Compliance'),
            const SizedBox(height: 12),
            AppCard(
              child: Column(
                children: [
                  _buildFeatureTile(
                    context,
                    icon: Icons.gavel_outlined,
                    title: 'eDiscovery & Legal Hold',
                    subtitle: 'Search and export emails for legal matters',
                    onTap: () {},
                  ),
                  _buildFeatureTile(
                    context,
                    icon: Icons.archive_outlined,
                    title: 'Email Archiving & Retention',
                    subtitle: 'Set policies for email retention and disposal',
                    onTap: () {},
                  ),
                  _buildFeatureTile(
                    context,
                    icon: Icons.policy_outlined,
                    title: 'Compliance Reporting',
                    subtitle: 'Generate reports for regulatory compliance',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Administration Features
            _buildSectionHeader(context, 'Administration'),
            const SizedBox(height: 12),
            AppCard(
              child: Column(
                children: [
                  _buildFeatureTile(
                    context,
                    icon: Icons.admin_panel_settings_outlined,
                    title: 'Advanced User Management',
                    subtitle: 'Manage user roles, permissions, and access',
                    onTap: () {},
                  ),
                  _buildFeatureTile(
                    context,
                    icon: Icons.history_outlined,
                    title: 'Audit Logs',
                    subtitle: 'Review user activity and security events',
                    onTap: () {},
                  ),
                  _buildFeatureTile(
                    context,
                    icon: Icons.analytics_outlined,
                    title: 'Usage Analytics',
                    subtitle: 'Monitor email usage and trends',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppCard(
      color: colorScheme.primaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.business_outlined,
                color: colorScheme.onPrimaryContainer,
                size: 32,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Unlock Your Enterprise Potential',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'MailCraft\'s enterprise features provide advanced security, compliance, and administration capabilities to meet the demands of your organization.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onPrimaryContainer,
            ),
          ),
        ],
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

  Widget _buildFeatureTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      leading: Icon(icon, color: colorScheme.primary, size: 28),
      title: Text(title,
          style: theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: theme.textTheme.bodyMedium),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }
}
