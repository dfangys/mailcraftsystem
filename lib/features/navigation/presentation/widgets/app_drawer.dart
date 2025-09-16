import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mailcraftsystem/features/auth/presentation/controllers/auth_controller.dart';

/// Main navigation drawer for the application
class AppDrawer extends ConsumerWidget {
  /// Creates an app drawer
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Drawer(
      child: Column(
        children: [
          // Header
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colorScheme.primary,
                  colorScheme.primary.withAlpha(204),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: colorScheme.onPrimary.withAlpha(51),
                  child: Icon(
                    Icons.person_outlined,
                    size: 32,
                    color: colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'User',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'user@example.com',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onPrimary.withAlpha(204),
                  ),
                ),
              ],
            ),
          ),

          // Menu items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  context,
                  icon: Icons.dashboard_outlined,
                  title: 'Dashboard',
                  route: '/dashboard',
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.inbox_outlined,
                  title: 'Inbox',
                  route: '/home',
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.send_outlined,
                  title: 'Sent',
                  route: '/home?folder=sent',
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.drafts_outlined,
                  title: 'Drafts',
                  route: '/home?folder=drafts',
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.archive_outlined,
                  title: 'Archive',
                  route: '/home?folder=archive',
                ),
                const Divider(),
                _buildDrawerItem(
                  context,
                  icon: Icons.search_outlined,
                  title: 'Search',
                  route: '/search',
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.edit_outlined,
                  title: 'Compose',
                  route: '/compose',
                ),
                const Divider(),
                _buildDrawerItem(
                  context,
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  route: '/settings',
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.business_outlined,
                  title: 'Enterprise',
                  route: '/enterprise',
                ),
              ],
            ),
          ),

          // Footer
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Sign Out'),
            onTap: () => _signOut(context, ref),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String route,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final currentUri = GoRouter.of(context).routeInformationProvider.value.uri;
    final routeUri = Uri.parse(route);
    final isSelected = currentUri.path == routeUri.path &&
        (routeUri.queryParameters.isEmpty ||
            routeUri.queryParameters.entries
                .every((e) => currentUri.queryParameters[e.key] == e.value));

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? colorScheme.primary : null,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? colorScheme.primary : null,
          fontWeight: isSelected ? FontWeight.w600 : null,
        ),
      ),
      selected: isSelected,
      selectedTileColor: colorScheme.primaryContainer.withAlpha(77),
      onTap: () {
        Navigator.of(context).pop();
        context.go(route);
      },
    );
  }

  void _signOut(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).logout();
    Navigator.of(context).pop();
    context.go('/login');
  }
}
