import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailcraftsystem/features/navigation/presentation/widgets/app_drawer.dart';
import 'package:mailcraftsystem/shared/widgets/app_card.dart';

/// Enterprise-grade settings screen with comprehensive options
class SettingsScreen extends ConsumerStatefulWidget {
  /// Creates a settings screen
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  // Mock settings values
  bool _notificationsEnabled = true;
  String _theme = 'system';
  String _syncFrequency = '15';
  bool _confirmDelete = true;
  bool _enableConversationView = true;
  String _defaultSignature = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'General'),
            _buildGeneralSettings(context),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Appearance'),
            _buildAppearanceSettings(context),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Sync'),
            _buildSyncSettings(context),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Actions'),
            _buildActionsSettings(context),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Advanced'),
            _buildAdvancedSettings(context),
            const SizedBox(height: 32),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildGeneralSettings(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          _buildSwitchTile(
            context,
            'Enable Notifications',
            'Receive alerts for new emails',
            _notificationsEnabled,
            (value) => setState(() => _notificationsEnabled = value),
            icon: Icons.notifications_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildAppearanceSettings(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          _buildRadioGroupTile(
            context,
            'Theme',
            'Choose your preferred app theme',
            _theme,
            {
              'system': 'System Default',
              'light': 'Light Mode',
              'dark': 'Dark Mode',
            },
            (value) => setState(() => _theme = value!),
            icon: Icons.color_lens_outlined,
          ),
          const Divider(),
          _buildSwitchTile(
            context,
            'Conversation View',
            'Group emails by conversation thread',
            _enableConversationView,
            (value) => setState(() => _enableConversationView = value),
            icon: Icons.forum_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildSyncSettings(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          _buildDropdownTile(
            context,
            'Sync Frequency',
            'How often to check for new emails',
            _syncFrequency,
            {
              '5': 'Every 5 minutes',
              '15': 'Every 15 minutes',
              '30': 'Every 30 minutes',
              '60': 'Every hour',
              'manual': 'Manually',
            },
            (value) => setState(() => _syncFrequency = value!),
            icon: Icons.sync_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildActionsSettings(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          _buildSwitchTile(
            context,
            'Confirm Before Deleting',
            'Show a confirmation dialog before deleting emails',
            _confirmDelete,
            (value) => setState(() => _confirmDelete = value),
            icon: Icons.delete_sweep_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildAdvancedSettings(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          _buildTextFieldTile(
            context,
            'Default Signature',
            'Set a default signature for new emails',
            _defaultSignature,
            (value) => setState(() => _defaultSignature = value),
            icon: Icons.notes_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(
    BuildContext context,
    String title,
    String subtitle,
    bool value,
    ValueChanged<bool> onChanged,
      {IconData? icon}) {
    return ListTile(
      leading: icon != null ? Icon(icon) : null,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  Widget _buildRadioGroupTile<T>(
    BuildContext context,
    String title,
    String subtitle,
    T groupValue,
    Map<T, String> options,
    ValueChanged<T?> onChanged,
      {IconData? icon}) {
    return ListTile(
      leading: icon != null ? Icon(icon) : null,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: DropdownButton<T>(
        value: groupValue,
        items: options.entries
            .map((entry) => DropdownMenuItem(
                  value: entry.key,
                  child: Text(entry.value),
                ))
            .toList(),
        onChanged: onChanged,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  Widget _buildDropdownTile<T>(
    BuildContext context,
    String title,
    String subtitle,
    T value,
    Map<T, String> items,
    ValueChanged<T?> onChanged,
      {IconData? icon}) {
    return ListTile(
      leading: icon != null ? Icon(icon) : null,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: DropdownButton<T>(
        value: value,
        items: items.entries
            .map((entry) => DropdownMenuItem(
                  value: entry.key,
                  child: Text(entry.value),
                ))
            .toList(),
        onChanged: onChanged,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  Widget _buildTextFieldTile(
    BuildContext context,
    String title,
    String subtitle,
    String value,
    ValueChanged<String> onChanged,
      {IconData? icon}) {
    return ListTile(
      leading: icon != null ? Icon(icon) : null,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: SizedBox(
        width: 150,
        child: TextFormField(
          initialValue: value,
          onChanged: onChanged,
          textAlign: TextAlign.end,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: _saveSettings,
            child: const Text('Save Changes'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton(
            onPressed: _resetSettings,
            child: const Text('Reset to Defaults'),
          ),
        ),
      ],
    );
  }

  void _saveSettings() {
    // In a real app, you would save the settings to a persistent storage
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings saved successfully')),
    );
  }

  void _resetSettings() {
    setState(() {
      _notificationsEnabled = true;
      _theme = 'system';
      _syncFrequency = '15';
      _confirmDelete = true;
      _enableConversationView = true;
      _defaultSignature = '';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings reset to defaults')),
    );
  }
}

