import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

/// Advanced settings model
class AdvancedSettings {
  /// Creates advanced settings
  const AdvancedSettings({
    this.allowInsecureSsl = false,
    this.imapSocketType = 'ssl',
    this.smtpSocketType = 'starttls',
    this.authMechanism = 'automatic',
    this.connectionTimeout = 30,
  });

  /// Allow insecure SSL connections
  final bool allowInsecureSsl;

  /// IMAP socket type
  final String imapSocketType;

  /// SMTP socket type
  final String smtpSocketType;

  /// Authentication mechanism
  final String authMechanism;

  /// Connection timeout in seconds
  final int connectionTimeout;

  /// Copy with method
  AdvancedSettings copyWith({
    bool? allowInsecureSsl,
    String? imapSocketType,
    String? smtpSocketType,
    String? authMechanism,
    int? connectionTimeout,
  }) {
    return AdvancedSettings(
      allowInsecureSsl: allowInsecureSsl ?? this.allowInsecureSsl,
      imapSocketType: imapSocketType ?? this.imapSocketType,
      smtpSocketType: smtpSocketType ?? this.smtpSocketType,
      authMechanism: authMechanism ?? this.authMechanism,
      connectionTimeout: connectionTimeout ?? this.connectionTimeout,
    );
  }
}

/// Advanced settings panel widget
class AdvancedSettingsPanel extends StatefulWidget {
  /// Creates an advanced settings panel
  const AdvancedSettingsPanel({
    required this.onSettingsChanged,
    this.initialSettings = const AdvancedSettings(),
    super.key,
  });

  /// Callback when settings change
  final ValueChanged<AdvancedSettings> onSettingsChanged;

  /// Initial settings
  final AdvancedSettings initialSettings;

  @override
  State<AdvancedSettingsPanel> createState() => _AdvancedSettingsPanelState();
}

class _AdvancedSettingsPanelState extends State<AdvancedSettingsPanel> {
  late AdvancedSettings _settings;

  @override
  void initState() {
    super.initState();
    _settings = widget.initialSettings;
  }

  void _updateSettings(AdvancedSettings newSettings) {
    setState(() {
      _settings = newSettings;
    });
    widget.onSettingsChanged(newSettings);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Security Settings Header
          Row(
            children: [
              Icon(
                Icons.settings,
                size: 20,
                color: colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 8),
              Text(
                'Security Settings',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Insecure SSL Toggle
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _settings.allowInsecureSsl
                  ? colorScheme.errorContainer.withOpacity(0.3)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _settings.allowInsecureSsl
                    ? colorScheme.error.withOpacity(0.3)
                    : colorScheme.outline.withOpacity(0.2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      _settings.allowInsecureSsl
                          ? Icons.settings
                          : Icons.settings,
                      size: 20,
                      color: _settings.allowInsecureSsl
                          ? colorScheme.error
                          : colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Allow Insecure SSL',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: _settings.allowInsecureSsl
                              ? colorScheme.error
                              : null,
                        ),
                      ),
                    ),
                    Switch(
                      value: _settings.allowInsecureSsl,
                      onChanged: (value) {
                        _updateSettings(
                          _settings.copyWith(allowInsecureSsl: value),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  _settings.allowInsecureSsl
                      ? '⚠️ WARNING: This allows connections to servers with invalid or self-signed certificates. Only enable for trusted legacy servers.'
                      : 'Secure SSL/TLS connections only (recommended)',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: _settings.allowInsecureSsl
                        ? colorScheme.error
                        : colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Connection Settings
          Row(
            children: [
              Icon(
                Icons.settings,
                size: 20,
                color: colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 8),
              Text(
                'Connection Settings',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // IMAP Socket Type
          _buildDropdownField(
            label: 'IMAP Security',
            value: _settings.imapSocketType,
            items: const [
              DropdownMenuItem(value: 'ssl', child: Text('SSL/TLS (993)')),
              DropdownMenuItem(value: 'starttls', child: Text('STARTTLS (143)')),
              DropdownMenuItem(value: 'plain', child: Text('Plain (143)')),
            ],
            onChanged: (value) {
              if (value != null) {
                _updateSettings(
                  _settings.copyWith(imapSocketType: value),
                );
              }
            },
          ),
          const SizedBox(height: 12),

          // SMTP Socket Type
          _buildDropdownField(
            label: 'SMTP Security',
            value: _settings.smtpSocketType,
            items: const [
              DropdownMenuItem(value: 'starttls', child: Text('STARTTLS (587)')),
              DropdownMenuItem(value: 'ssl', child: Text('SSL/TLS (465)')),
              DropdownMenuItem(value: 'plain', child: Text('Plain (25/587)')),
            ],
            onChanged: (value) {
              if (value != null) {
                _updateSettings(
                  _settings.copyWith(smtpSocketType: value),
                );
              }
            },
          ),
          const SizedBox(height: 12),

          // Authentication Mechanism
          _buildDropdownField(
            label: 'Authentication',
            value: _settings.authMechanism,
            items: const [
              DropdownMenuItem(value: 'automatic', child: Text('Automatic')),
              DropdownMenuItem(value: 'plain', child: Text('Plain')),
              DropdownMenuItem(value: 'login', child: Text('Login')),
              DropdownMenuItem(value: 'oauth2', child: Text('OAuth 2.0')),
            ],
            onChanged: (value) {
              if (value != null) {
                _updateSettings(
                  _settings.copyWith(authMechanism: value),
                );
              }
            },
          ),
          const SizedBox(height: 12),

          // Connection Timeout
          Row(
            children: [
              Expanded(
                child: Text(
                  'Connection Timeout',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              SizedBox(
                width: 80,
                child: DropdownButtonFormField<int>(
                  value: _settings.connectionTimeout,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(value: 15, child: Text('15s')),
                    DropdownMenuItem(value: 30, child: Text('30s')),
                    DropdownMenuItem(value: 60, child: Text('60s')),
                    DropdownMenuItem(value: 120, child: Text('2m')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      _updateSettings(
                        _settings.copyWith(connectionTimeout: value),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<DropdownMenuItem<String>> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(
          width: 140,
          child: DropdownButtonFormField<String>(
            value: value,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
            ),
            items: items,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
