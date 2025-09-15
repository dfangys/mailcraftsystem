import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

/// Accessibility utilities for enhanced user experience
class AccessibilityUtils {
  /// Announce a message to screen readers
  static void announce(BuildContext context, String message) {
    SemanticsService.announce(message, TextDirection.ltr);
  }

  /// Create semantic label for email count
  static String emailCountLabel(int count) {
    if (count == 0) return 'No emails';
    if (count == 1) return '1 email';
    return '$count emails';
  }

  /// Create semantic label for unread count
  static String unreadCountLabel(int count) {
    if (count == 0) return 'No unread emails';
    if (count == 1) return '1 unread email';
    return '$count unread emails';
  }

  /// Create semantic label for attachment count
  static String attachmentCountLabel(int count) {
    if (count == 0) return 'No attachments';
    if (count == 1) return '1 attachment';
    return '$count attachments';
  }

  /// Create semantic label for date
  static String dateLabel(DateTime? date) {
    if (date == null) return 'No date';

    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today at ${_formatTime(date)}';
    } else if (difference.inDays == 1) {
      return 'Yesterday at ${_formatTime(date)}';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return 'On ${date.day}/${date.month}/${date.year}';
    }
  }

  /// Create semantic label for email priority
  static String priorityLabel(MessagePriority priority) {
    switch (priority) {
      case MessagePriority.high:
        return 'High priority';
      case MessagePriority.low:
        return 'Low priority';
      case MessagePriority.normal:
        return 'Normal priority';
    }
  }

  /// Create semantic label for email status
  static String statusLabel({
    required bool isRead,
    required bool isFlagged,
    required bool hasAttachments,
  }) {
    final statuses = <String>[];

    if (!isRead) statuses.add('unread');
    if (isFlagged) statuses.add('flagged');
    if (hasAttachments) statuses.add('has attachments');

    if (statuses.isEmpty) return 'read email';
    return statuses.join(', ');
  }

  /// Create accessible button with proper semantics
  static Widget accessibleButton({
    required Widget child,
    required VoidCallback? onPressed,
    required String semanticLabel,
    String? tooltip,
    bool excludeSemantics = false,
  }) {
    var button = child;

    if (!excludeSemantics) {
      button = Semantics(
        label: semanticLabel,
        button: true,
        enabled: onPressed != null,
        child: button,
      );
    }

    if (tooltip != null) {
      button = Tooltip(
        message: tooltip,
        child: button,
      );
    }

    return button;
  }

  /// Create accessible list tile with proper semantics
  static Widget accessibleListTile({
    required Widget title,
    required VoidCallback? onTap,
    required String semanticLabel,
    Widget? subtitle,
    Widget? leading,
    Widget? trailing,
    bool selected = false,
  }) {
    return Semantics(
      label: semanticLabel,
      button: true,
      enabled: onTap != null,
      selected: selected,
      child: ListTile(
        title: title,
        subtitle: subtitle,
        leading: leading,
        trailing: trailing,
        onTap: onTap,
        selected: selected,
      ),
    );
  }

  /// Create accessible text field with proper semantics
  static Widget accessibleTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    String? semanticLabel,
    bool obscureText = false,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return Semantics(
      label: semanticLabel ?? label,
      textField: true,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }

  /// Create accessible card with proper semantics
  static Widget accessibleCard({
    required Widget child,
    required String semanticLabel,
    VoidCallback? onTap,
    bool selected = false,
  }) {
    return Semantics(
      label: semanticLabel,
      button: onTap != null,
      selected: selected,
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }

  /// Create accessible icon with semantic label
  static Widget accessibleIcon({
    required IconData icon,
    required String semanticLabel,
    Color? color,
    double? size,
  }) {
    return Semantics(
      label: semanticLabel,
      child: ExcludeSemantics(
        child: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }

  /// Create accessible badge with count
  static Widget accessibleBadge({
    required Widget child,
    required int count,
    String? semanticLabel,
  }) {
    final label = semanticLabel ?? emailCountLabel(count);

    return Semantics(
      label: label,
      child: Badge(
        label: Text(count.toString()),
        isLabelVisible: count > 0,
        child: child,
      ),
    );
  }

  /// Create accessible progress indicator
  static Widget accessibleProgressIndicator({
    double? value,
    String? semanticLabel,
  }) {
    return Semantics(
      label: semanticLabel ??
          (value != null
              ? 'Loading ${(value * 100).round()}% complete'
              : 'Loading'),
      child: value != null
          ? LinearProgressIndicator(value: value)
          : const CircularProgressIndicator(),
    );
  }

  /// Check if high contrast mode is enabled
  static bool isHighContrastEnabled(BuildContext context) {
    return MediaQuery.of(context).highContrast;
  }

  /// Check if reduce motion is enabled
  static bool isReduceMotionEnabled(BuildContext context) {
    return MediaQuery.of(context).disableAnimations;
  }

  /// Get accessible text scale factor
  static double getTextScaleFactor(BuildContext context) {
    return MediaQuery.of(context).textScaler.scale(1);
  }

  /// Create accessible animation with motion sensitivity
  static Widget accessibleAnimation({
    required Widget child,
    required Animation<double> animation,
    BuildContext? context,
  }) {
    if (context != null && isReduceMotionEnabled(context)) {
      return child;
    }

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => child!,
      child: child,
    );
  }

  /// Format time for accessibility
  static String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

    return '$displayHour:$minute $period';
  }
}

/// Message priority enum for accessibility
enum MessagePriority {
  /// Low priority
  low,

  /// Normal priority
  normal,

  /// High priority
  high,
}

/// Accessible wrapper widget for complex UI components
class AccessibleWrapper extends StatelessWidget {
  /// Creates an accessible wrapper
  const AccessibleWrapper({
    required this.child,
    required this.semanticLabel,
    super.key,
    this.hint,
    this.onTap,
    this.selected = false,
    this.enabled = true,
  });

  /// Child widget
  final Widget child;

  /// Semantic label for screen readers
  final String semanticLabel;

  /// Additional hint for screen readers
  final String? hint;

  /// Tap callback
  final VoidCallback? onTap;

  /// Whether the item is selected
  final bool selected;

  /// Whether the item is enabled
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      hint: hint,
      button: onTap != null,
      selected: selected,
      enabled: enabled,
      child: GestureDetector(
        onTap: enabled ? onTap : null,
        child: child,
      ),
    );
  }
}

/// Accessible focus manager for keyboard navigation
class AccessibleFocusManager extends StatefulWidget {
  /// Creates an accessible focus manager
  const AccessibleFocusManager({
    required this.child,
    super.key,
    this.autofocus = false,
  });

  /// Child widget
  final Widget child;

  /// Whether to autofocus
  final bool autofocus;

  @override
  State<AccessibleFocusManager> createState() => _AccessibleFocusManagerState();
}

class _AccessibleFocusManagerState extends State<AccessibleFocusManager> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    if (widget.autofocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      child: widget.child,
    );
  }
}
