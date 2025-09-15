import 'package:flutter/material.dart';

/// Button styles for the app
enum AppButtonStyle {
  /// Primary filled button
  primary,
  /// Secondary outlined button
  secondary,
  /// Text button
  text,
  /// Floating action button
  fab,
  /// Icon button
  icon,
}

/// A reusable button widget with consistent styling
class AppButton extends StatelessWidget {
  /// Creates an app button
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.style = AppButtonStyle.primary,
    this.icon,
    this.isLoading = false,
    this.isEnabled = true,
    this.width,
    this.height,
  });

  /// Creates an icon button
  const AppButton.icon({
    super.key,
    required this.icon,
    required this.onPressed,
    this.text,
    this.style = AppButtonStyle.icon,
    this.isLoading = false,
    this.isEnabled = true,
    this.width,
    this.height,
  });

  /// Creates a floating action button
  const AppButton.fab({
    super.key,
    required this.icon,
    required this.onPressed,
    this.text,
    this.style = AppButtonStyle.fab,
    this.isLoading = false,
    this.isEnabled = true,
    this.width,
    this.height,
  });

  /// The text to display on the button
  final String? text;

  /// The icon to display
  final IconData? icon;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// The button style
  final AppButtonStyle style;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Whether the button is enabled
  final bool isEnabled;

  /// Button width
  final double? width;

  /// Button height
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveOnPressed = (isEnabled && !isLoading) ? onPressed : null;

    Widget buttonChild;
    if (isLoading) {
      buttonChild = SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            style == AppButtonStyle.primary
                ? colorScheme.onPrimary
                : colorScheme.primary,
          ),
        ),
      );
    } else if (icon != null && text != null) {
      buttonChild = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(text!),
        ],
      );
    } else if (icon != null) {
      buttonChild = Icon(icon);
    } else {
      buttonChild = Text(text ?? '');
    }

    Widget button;
    switch (style) {
      case AppButtonStyle.primary:
        button = FilledButton(
          onPressed: effectiveOnPressed,
          child: buttonChild,
        );
        break;
      case AppButtonStyle.secondary:
        button = OutlinedButton(
          onPressed: effectiveOnPressed,
          child: buttonChild,
        );
        break;
      case AppButtonStyle.text:
        button = TextButton(
          onPressed: effectiveOnPressed,
          child: buttonChild,
        );
        break;
      case AppButtonStyle.fab:
        button = FloatingActionButton(
          onPressed: effectiveOnPressed,
          child: buttonChild,
        );
        break;
      case AppButtonStyle.icon:
        button = IconButton(
          onPressed: effectiveOnPressed,
          icon: buttonChild,
        );
        break;
    }

    if (width != null || height != null) {
      return SizedBox(
        width: width,
        height: height,
        child: button,
      );
    }

    return button;
  }
}

/// A specialized button for form submissions
class SubmitButton extends StatelessWidget {
  /// Creates a submit button
  const SubmitButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
  });

  /// The text to display
  final String text;

  /// Callback when pressed
  final VoidCallback? onPressed;

  /// Whether the button is loading
  final bool isLoading;

  /// Whether the button is enabled
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: AppButton(
        text: text,
        onPressed: onPressed,
        isLoading: isLoading,
        isEnabled: isEnabled,
        style: AppButtonStyle.primary,
      ),
    );
  }
}

/// A button with destructive action styling
class DestructiveButton extends StatelessWidget {
  /// Creates a destructive button
  const DestructiveButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.isEnabled = true,
  });

  /// The text to display
  final String text;

  /// The icon to display
  final IconData? icon;

  /// Callback when pressed
  final VoidCallback? onPressed;

  /// Whether the button is loading
  final bool isLoading;

  /// Whether the button is enabled
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveOnPressed = (isEnabled && !isLoading) ? onPressed : null;

    Widget buttonChild;
    if (isLoading) {
      buttonChild = SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(colorScheme.onError),
        ),
      );
    } else if (icon != null) {
      buttonChild = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(text),
        ],
      );
    } else {
      buttonChild = Text(text);
    }

    return FilledButton(
      onPressed: effectiveOnPressed,
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.error,
        foregroundColor: colorScheme.onError,
      ),
      child: buttonChild,
    );
  }
}
