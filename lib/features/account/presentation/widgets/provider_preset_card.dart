import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

/// Provider preset card widget
class ProviderPresetCard extends StatelessWidget {
  /// Creates a provider preset card
  const ProviderPresetCard({
    required this.providerId,
    required this.name,
    required this.description,
    required this.icon,
    required this.onTap,
    super.key,
  });

  /// Provider identifier
  final String providerId;

  /// Provider display name
  final String name;

  /// Provider description
  final String description;

  /// Provider icon
  final IconData icon;

  /// Callback when card is tapped
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Provider icon
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _getProviderColor(providerId, colorScheme),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),

              // Provider info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),

              // Arrow icon
              Icon(
                Icons.email,
                color: colorScheme.onSurfaceVariant,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getProviderColor(String providerId, ColorScheme colorScheme) {
    switch (providerId) {
      case 'gmail':
        return const Color(0xFFDB4437); // Google Red
      case 'outlook':
        return const Color(0xFF0078D4); // Microsoft Blue
      case 'yahoo':
        return const Color(0xFF6001D2); // Yahoo Purple
      case 'wahda':
        return const Color(0xFF1B5E20); // Bank Green
      default:
        return colorScheme.primary;
    }
  }
}
