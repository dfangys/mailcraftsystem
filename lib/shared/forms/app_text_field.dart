import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Reusable text field widget with consistent styling
class AppTextField extends StatelessWidget {
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
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
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
  
  /// Hint text
  final String? hintText;
  
  /// Whether to autofocus
  final bool autofocus;
  
  /// Whether to enable autocorrect
  final bool autocorrect;
  
  /// Whether to enable suggestions
  final bool enableSuggestions;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      autofocus: autofocus,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        helperText: helperText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: enabled 
            ? Theme.of(context).colorScheme.surface
            : Theme.of(context).colorScheme.surfaceContainerHighest
                .withValues(alpha: 0.5),
      ),
    );
  }
}
