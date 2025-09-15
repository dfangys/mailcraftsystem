import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mailcraftsystem/shared/utils/responsive_layout.dart';

/// Reusable text field widget with consistent styling, responsive design, and accessibility
class AppTextField extends StatefulWidget {
  /// Creates a text field widget
  const AppTextField({
    required this.label,
    super.key,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.helperText,
    this.hintText,
    this.hint,
    this.semanticLabel,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.style = AppTextFieldStyle.outlined,
    this.size = AppTextFieldSize.medium,
  });

  /// Label text for the field
  final String label;

  /// Text editing controller
  final TextEditingController? controller;

  /// Initial value for the field
  final String? initialValue;

  /// Callback when text changes
  final ValueChanged<String>? onChanged;

  /// Callback when field is submitted
  final ValueChanged<String>? onSubmitted;

  /// Validator function
  final FormFieldValidator<String>? validator;

  /// Whether to obscure text (for passwords)
  final bool obscureText;

  /// Whether the field is enabled
  final bool enabled;

  /// Whether the field is read-only
  final bool readOnly;

  /// Maximum number of lines
  final int? maxLines;

  /// Keyboard type
  final TextInputType? keyboardType;

  /// Text input action
  final TextInputAction? textInputAction;

  /// Input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Prefix icon
  final Widget? prefixIcon;

  /// Suffix icon
  final Widget? suffixIcon;

  /// Helper text
  final String? helperText;

  /// Hint text (legacy support)
  final String? hintText;

  /// Hint text (new property)
  final String? hint;

  /// Semantic label for accessibility
  final String? semanticLabel;

  /// Whether to autofocus
  final bool autofocus;

  /// Whether to enable autocorrect
  final bool autocorrect;

  /// Whether to enable suggestions
  final bool enableSuggestions;

  /// Text field style
  final AppTextFieldStyle style;

  /// Text field size
  final AppTextFieldSize size;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticLabel ?? widget.label,
      textField: true,
      enabled: widget.enabled,
      child: TextFormField(
        controller: widget.controller,
        initialValue: widget.initialValue,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmitted,
        validator: widget.validator,
        obscureText: _obscureText,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        maxLines: widget.obscureText ? 1 : widget.maxLines,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        inputFormatters: widget.inputFormatters,
        autofocus: widget.autofocus,
        autocorrect: widget.autocorrect,
        enableSuggestions: widget.enableSuggestions,
        style: _getTextStyle(context),
        decoration: _buildInputDecoration(context),
      ),
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hintText = widget.hint ?? widget.hintText;

    var suffixIcon = widget.suffixIcon;

    // Add password visibility toggle for obscured text
    if (widget.obscureText) {
      suffixIcon = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.suffixIcon != null) widget.suffixIcon!,
          IconButton(
            icon: Icon(
              _obscureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
            ),
            onPressed: () => setState(() => _obscureText = !_obscureText),
            tooltip: _obscureText ? 'Show password' : 'Hide password',
          ),
        ],
      );
    }

    switch (widget.style) {
      case AppTextFieldStyle.filled:
        return InputDecoration(
          labelText: widget.label,
          hintText: hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: colorScheme.surfaceContainerHighest.withAlpha(77),
          border: OutlineInputBorder(
            borderRadius: ResponsiveLayout.getResponsiveBorderRadius(context),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: ResponsiveLayout.getResponsiveBorderRadius(context),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: ResponsiveLayout.getResponsiveBorderRadius(context),
            borderSide: BorderSide(color: colorScheme.primary, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: ResponsiveLayout.getResponsiveBorderRadius(context),
            borderSide: BorderSide(color: colorScheme.error, width: 2),
          ),
          contentPadding: _getContentPadding(context),
        );

      case AppTextFieldStyle.underlined:
        return InputDecoration(
          labelText: widget.label,
          hintText: hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: suffixIcon,
          border: const UnderlineInputBorder(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorScheme.outline),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorScheme.primary, width: 2),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorScheme.error, width: 2),
          ),
          contentPadding: _getContentPadding(context),
        );

      case AppTextFieldStyle.outlined:
        return InputDecoration(
          labelText: widget.label,
          hintText: hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: ResponsiveLayout.getResponsiveBorderRadius(context),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: ResponsiveLayout.getResponsiveBorderRadius(context),
            borderSide: BorderSide(color: colorScheme.outline),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: ResponsiveLayout.getResponsiveBorderRadius(context),
            borderSide: BorderSide(color: colorScheme.primary, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: ResponsiveLayout.getResponsiveBorderRadius(context),
            borderSide: BorderSide(color: colorScheme.error),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: ResponsiveLayout.getResponsiveBorderRadius(context),
            borderSide: BorderSide(color: colorScheme.error, width: 2),
          ),
          filled: true,
          fillColor: widget.enabled
              ? colorScheme.surface
              : colorScheme.surfaceContainerHighest.withAlpha(128),
          contentPadding: _getContentPadding(context),
        );
    }
  }

  TextStyle? _getTextStyle(BuildContext context) {
    final theme = Theme.of(context);

    switch (widget.size) {
      case AppTextFieldSize.small:
        return theme.textTheme.bodySmall?.copyWith(
          fontSize: ResponsiveLayout.getResponsiveFontSize(
            context,
            mobileSize: 12,
            tabletSize: 14,
          ),
        );
      case AppTextFieldSize.large:
        return theme.textTheme.bodyLarge?.copyWith(
          fontSize: ResponsiveLayout.getResponsiveFontSize(
            context,
            mobileSize: 16,
            tabletSize: 18,
            desktopSize: 20,
          ),
        );
      case AppTextFieldSize.medium:
        return theme.textTheme.bodyMedium?.copyWith(
          fontSize: ResponsiveLayout.getResponsiveFontSize(
            context,
            mobileSize: 14,
            tabletSize: 16,
          ),
        );
    }
  }

  EdgeInsets _getContentPadding(BuildContext context) {
    switch (widget.size) {
      case AppTextFieldSize.small:
        return ResponsiveLayout.getResponsivePadding(
          context,
          mobile: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          tablet: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          desktop: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        );
      case AppTextFieldSize.large:
        return ResponsiveLayout.getResponsivePadding(
          context,
          mobile: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          tablet: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          desktop: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        );
      case AppTextFieldSize.medium:
        return ResponsiveLayout.getResponsivePadding(
          context,
          mobile: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          tablet: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        );
    }
  }
}

/// Text field style variants
enum AppTextFieldStyle {
  /// Outlined style with border
  outlined,

  /// Filled style with background
  filled,

  /// Underlined style
  underlined,
}

/// Text field size variants
enum AppTextFieldSize {
  /// Small size
  small,

  /// Medium size (default)
  medium,

  /// Large size
  large,
}

