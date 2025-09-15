import 'package:flutter/material.dart';

/// A reusable card widget with consistent styling across the app
class AppCard extends StatelessWidget {
  /// Creates an app card
  const AppCard({
    required this.child,
    super.key,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.all(8),
    this.elevation = 2,
    this.onTap,
    this.color,
  });

  /// The widget to display inside the card
  final Widget child;

  /// Padding inside the card
  final EdgeInsets padding;

  /// Margin around the card
  final EdgeInsets margin;

  /// Card elevation
  final double elevation;

  /// Callback when card is tapped
  final VoidCallback? onTap;

  /// Card background color
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final card = Card(
      elevation: elevation,
      color: color,
      margin: margin,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: card,
      );
    }

    return card;
  }
}

/// A specialized card for displaying statistics
class StatCard extends StatelessWidget {
  /// Creates a stat card
  const StatCard({
    required this.title,
    required this.value,
    required this.icon,
    super.key,
    this.subtitle,
    this.onTap,
    this.color,
  });

  /// The title of the statistic
  final String title;

  /// The value to display
  final String value;

  /// The icon to display
  final IconData icon;

  /// Optional subtitle
  final String? subtitle;

  /// Callback when card is tapped
  final VoidCallback? onTap;

  /// Card color theme
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: color ?? colorScheme.primary,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: color ?? colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// A card for displaying quick actions
class ActionCard extends StatelessWidget {
  /// Creates an action card
  const ActionCard({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
    this.subtitle,
    this.color,
  });

  /// The title of the action
  final String title;

  /// The icon to display
  final IconData icon;

  /// Callback when card is tapped
  final VoidCallback onTap;

  /// Optional subtitle
  final String? subtitle;

  /// Card color theme
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppCard(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color ?? colorScheme.primary,
            size: 32,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
