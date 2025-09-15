import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mailcraftsystem/features/auth/presentation/controllers/auth_controller.dart';
import 'package:mailcraftsystem/shared/widgets/app_button.dart';

/// Main navigation drawer for the application
class AppDrawer extends ConsumerWidget {
  /// Creates an app drawer
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authState = ref.watch(authControllerProvider);

    return Drawer(
      child: Column(
        children: [
          // Header section
          _DrawerHeader(
            userEmail: authState.user?.email ?? 'user@example.com',
            userName: authState.user?.name ?? 'User',
          ),
          
          // Navigation items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _DrawerSection(
                  title: 'Mail',
                  items: [
                    _DrawerItem(
                      icon: Icons.dashboard_outlined,
                      title: 'Dashboard',
                      onTap: () => _navigateTo(context, '/dashboard'),
                    ),
                    _DrawerItem(
                      icon: Icons.inbox_outlined,
                      title: 'Inbox',
                      onTap: () => _navigateTo(context, '/home'),
                      badge: '12',
                    ),
                    _DrawerItem(
                      icon: Icons.folder_outlined,
                      title: 'Mailboxes',
                      onTap: () => _navigateTo(context, '/mailbox'),
                    ),
                    _DrawerItem(
                      icon: Icons.edit_outlined,
                      title: 'Compose',
                      onTap: () => _navigateTo(context, '/compose'),
                    ),
                    _DrawerItem(
                      icon: Icons.send_outlined,
                      title: 'Sent',
                      onTap: () => _navigateTo(context, '/mailbox?folder=sent'),
                    ),
                    _DrawerItem(
                      icon: Icons.drafts_outlined,
                      title: 'Drafts',
                      onTap: () => _navigateTo(context, '/mailbox?folder=drafts'),
                      badge: '3',
                    ),
                    _DrawerItem(
                      icon: Icons.delete_outline,
                      title: 'Trash',
                      onTap: () => _navigateTo(context, '/mailbox?folder=trash'),
                    ),
                  ],
                ),
                
                const Divider(),
                
                _DrawerSection(
                  title: 'Tools',
                  items: [
                    _DrawerItem(
                      icon: Icons.search_outlined,
                      title: 'Search',
                      onTap: () => _navigateTo(context, '/search'),
                    ),
                    _DrawerItem(
                      icon: Icons.sync_outlined,
                      title: 'Sync Status',
                      onTap: () => _navigateTo(context, '/message-handling'),
                    ),
                  ],
                ),
                
                const Divider(),
                
                _DrawerSection(
                  title: 'Enterprise',
                  items: [
                    _DrawerItem(
                      icon: Icons.business_outlined,
                      title: 'Enterprise Features',
                      onTap: () => _navigateTo(context, '/enterprise'),
                    ),
                    _DrawerItem(
                      icon: Icons.analytics_outlined,
                      title: 'Analytics',
                      onTap: () => _navigateTo(context, '/enterprise?tab=analytics'),
                    ),
                    _DrawerItem(
                      icon: Icons.security_outlined,
                      title: 'Security',
                      onTap: () => _navigateTo(context, '/enterprise?tab=security'),
                    ),
                  ],
                ),
                
                const Divider(),
                
                _DrawerSection(
                  title: 'Account',
                  items: [
                    _DrawerItem(
                      icon: Icons.account_circle_outlined,
                      title: 'Account Setup',
                      onTap: () => _navigateTo(context, '/account-setup'),
                    ),
                    _DrawerItem(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () => _navigateTo(context, '/settings'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Footer section
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // App version
                Text(
                  'MailCraft v1.0.0',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Logout button
                SizedBox(
                  width: double.infinity,
                  child: AppButton(
                    text: 'Sign Out',
                    icon: Icons.logout_outlined,
                    style: AppButtonStyle.secondary,
                    onPressed: () => _handleLogout(context, ref),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, String route) {
    Navigator.of(context).pop(); // Close drawer
    context.go(route);
  }

  void _handleLogout(BuildContext context, WidgetRef ref) {
    Navigator.of(context).pop(); // Close drawer
    ref.read(authControllerProvider.notifier).logout();
    context.go('/login');
  }
}

/// Drawer header with user information
class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    required this.userEmail,
    required this.userName,
  });

  final String userEmail;
  final String userName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary,
            colorScheme.primaryContainer,
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User avatar
              CircleAvatar(
                radius: 32,
                backgroundColor: colorScheme.surface,
                child: Icon(
                  Icons.person_outline,
                  size: 32,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              
              // User name
              Text(
                userName,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              
              // User email
              Text(
                userEmail,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onPrimary.withOpacity(0.8),
                ),
              ),
              
              const Spacer(),
              
              // Status indicator
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Online',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onPrimary.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Section header for grouping drawer items
class _DrawerSection extends StatelessWidget {
  const _DrawerSection({
    required this.title,
    required this.items,
  });

  final String title;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        ...items,
      ],
    );
  }
}

/// Individual drawer navigation item
class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.badge,
    this.isSelected = false,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final String? badge;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: isSelected ? colorScheme.primary : colorScheme.onSurface,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      trailing: badge != null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badge!,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
      selected: isSelected,
      selectedTileColor: colorScheme.primaryContainer.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      onTap: onTap,
    );
  }
}
