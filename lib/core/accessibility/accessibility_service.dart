import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';

import 'package:mailcraftsystem/core/logging/logger.dart';

/// A service that provides accessibility features for the application.
///
/// This service provides a centralized way to manage accessibility settings,
/// check for accessibility features, and create accessible widgets.
class AccessibilityService {
  AccessibilityService._();
  static AccessibilityService? _instance;

  /// Returns the singleton instance of the [AccessibilityService].
  static AccessibilityService get instance {
    _instance ??= AccessibilityService._();
    return _instance!;
  }

  AccessibilitySettings _settings = const AccessibilitySettings();

  /// Returns the current accessibility settings.
  AccessibilitySettings get settings => _settings;

  /// Updates the accessibility settings.
  void updateSettings(AccessibilitySettings newSettings) {
    _settings = newSettings;
    AppLogger.info('Accessibility settings updated');
  }

  /// Returns `true` if a screen reader is enabled.
  bool get isScreenReaderEnabled {
    return WidgetsBinding.instance.accessibilityFeatures.accessibleNavigation;
  }

  /// Returns `true` if high contrast is enabled.
  bool get isHighContrastEnabled {
    return WidgetsBinding.instance.accessibilityFeatures.highContrast;
  }

  /// Returns `true` if large text is enabled.
  bool get isLargeTextEnabled {
    return WidgetsBinding.instance.accessibilityFeatures.boldText;
  }

  /// Returns `true` if reduce motion is enabled.
  bool get isReduceMotionEnabled {
    return WidgetsBinding.instance.accessibilityFeatures.disableAnimations;
  }

  /// Returns the text scale factor based on the accessibility settings.
  double getTextScaleFactor(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var scaleFactor = mediaQuery.textScaleFactor;

    // Apply custom scaling if enabled
    if (_settings.enableCustomTextScaling) {
      scaleFactor *= _settings.textScaleFactor;
    }

    // Ensure minimum and maximum bounds
    return scaleFactor.clamp(_settings.minTextScale, _settings.maxTextScale);
  }

  /// Returns a contrast color based on the accessibility settings.
  Color getContrastColor(Color baseColor, {bool isBackground = false}) {
    if (!isHighContrastEnabled && !_settings.enableHighContrast) {
      return baseColor;
    }

    // Calculate luminance
    final luminance = baseColor.computeLuminance();

    if (isBackground) {
      // For backgrounds, use high contrast alternatives
      return luminance > 0.5 ? Colors.white : Colors.black;
    } else {
      // For text/foreground, ensure sufficient contrast
      return luminance > 0.5 ? Colors.black : Colors.white;
    }
  }

  /// Returns a semantic label for a UI element.
  String getSemanticLabel(
    String text, {
    String? hint,
    String? role,
    bool isButton = false,
    bool isLink = false,
    bool isHeading = false,
  }) {
    final buffer = StringBuffer();

    // Add role information
    if (isHeading) {
      buffer.write('Heading: ');
    } else if (isButton) {
      buffer.write('Button: ');
    } else if (isLink) {
      buffer.write('Link: ');
    } else if (role != null) {
      buffer.write('$role: ');
    }

    // Add main text
    buffer.write(text);

    // Add hint if provided
    if (hint != null) {
      buffer.write('. $hint');
    }

    return buffer.toString();
  }

  /// Creates a [SemanticsProperties] object for a widget.
  SemanticsProperties createSemanticsProperties({
    required String label,
    String? hint,
    String? value,
    bool isButton = false,
    bool isLink = false,
    bool isHeading = false,
    bool isSelected = false,
    bool isEnabled = true,
    VoidCallback? onTap,
  }) {
    return SemanticsProperties(
      label: getSemanticLabel(
        label,
        hint: hint,
        isButton: isButton,
        isLink: isLink,
        isHeading: isHeading,
      ),
      hint: hint,
      value: value,
      button: isButton,
      link: isLink,
      header: isHeading,
      selected: isSelected,
      enabled: isEnabled,
      onTap: onTap,
    );
  }

  /// Announces a message to the screen reader.
  void announceMessage(
    String message, {
    Assertiveness assertiveness = Assertiveness.polite,
  }) {
    if (isScreenReaderEnabled) {
      SemanticsService.announce(message, TextDirection.ltr);
      AppLogger.info('Screen reader announcement: $message');
    }
  }

  /// Provides haptic feedback based on the accessibility settings.
  void provideHapticFeedback(HapticFeedbackType type) {
    if (_settings.enableHapticFeedback) {
      switch (type) {
        case HapticFeedbackType.lightImpact:
          HapticFeedback.lightImpact();
        case HapticFeedbackType.mediumImpact:
          HapticFeedback.mediumImpact();
        case HapticFeedbackType.heavyImpact:
          HapticFeedback.heavyImpact();
        case HapticFeedbackType.selectionClick:
          HapticFeedback.selectionClick();
        case HapticFeedbackType.vibrate:
          HapticFeedback.vibrate();
      }
    }
  }

  /// Returns the animation duration based on the accessibility settings.
  Duration getAnimationDuration(Duration defaultDuration) {
    if (isReduceMotionEnabled || _settings.reduceMotion) {
      return Duration.zero;
    }

    return defaultDuration * _settings.animationSpeedFactor;
  }

  /// Calculates the contrast ratio between two colors.
  double calculateContrastRatio(Color color1, Color color2) {
    final luminance1 = color1.computeLuminance();
    final luminance2 = color2.computeLuminance();

    final lighter = luminance1 > luminance2 ? luminance1 : luminance2;
    final darker = luminance1 > luminance2 ? luminance2 : luminance1;

    return (lighter + 0.05) / (darker + 0.05);
  }

  /// Checks if a color combination meets WCAG standards.
  bool meetsWCAGStandards(
    Color foreground,
    Color background, {
    WCAGLevel level = WCAGLevel.aa,
    bool isLargeText = false,
  }) {
    final contrastRatio = calculateContrastRatio(foreground, background);

    switch (level) {
      case WCAGLevel.aa:
        return isLargeText ? contrastRatio >= 3 : contrastRatio >= 4.5;
      case WCAGLevel.aaa:
        return isLargeText ? contrastRatio >= 4.5 : contrastRatio >= 7;
    }
  }

  /// Returns the focus order for keyboard navigation.
  List<FocusNode> getFocusOrder(List<FocusNode> nodes) {
    // Sort by reading order (top to bottom, left to right)
    return nodes
      ..sort((a, b) {
        final aRect = a.rect;
        final bRect = b.rect;

        // Compare by vertical position first
        final verticalDiff = aRect.top.compareTo(bRect.top);
        if (verticalDiff != 0) return verticalDiff;

        // Then by horizontal position
        return aRect.left.compareTo(bRect.left);
      });
  }

  /// Creates an accessible button.
  Widget createAccessibleButton({
    required String label,
    required VoidCallback onPressed,
    String? hint,
    Widget? child,
    ButtonStyle? style,
  }) {
    return Semantics(
      label: getSemanticLabel(label, hint: hint, isButton: true),
      hint: hint,
      button: true,
      enabled: true,
      onTap: onPressed,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: child ?? Text(label),
      ),
    );
  }

  /// Creates an accessible text field.
  Widget createAccessibleTextField({
    required String label,
    String? hint,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    bool obscureText = false,
  }) {
    return Semantics(
      label: getSemanticLabel(label, hint: hint),
      hint: hint,
      textField: true,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}

/// A class that represents the accessibility settings.
class AccessibilitySettings {
  /// Creates a new instance of [AccessibilitySettings].
  const AccessibilitySettings({
    this.enableHighContrast = false,
    this.enableCustomTextScaling = false,
    this.textScaleFactor = 1,
    this.minTextScale = 0.8,
    this.maxTextScale = 3,
    this.enableHapticFeedback = true,
    this.reduceMotion = false,
    this.animationSpeedFactor = 1,
    this.enableVoiceOver = false,
    this.enableLargeText = false,
    this.enableBoldText = false,
    this.colorBlindnessType = ColorBlindnessType.none,
  });

  /// Whether high contrast mode is enabled.
  final bool enableHighContrast;

  /// Whether custom text scaling is enabled.
  final bool enableCustomTextScaling;

  /// The current text scale factor.
  final double textScaleFactor;

  /// The minimum allowed text scale.
  final double minTextScale;

  /// The maximum allowed text scale.
  final double maxTextScale;

  /// Whether haptic feedback is enabled.
  final bool enableHapticFeedback;

  /// Whether motion should be reduced.
  final bool reduceMotion;

  /// The animation speed multiplier factor.
  final double animationSpeedFactor;

  /// Whether VoiceOver is enabled.
  final bool enableVoiceOver;

  /// Whether large text is enabled.
  final bool enableLargeText;

  /// Whether bold text is enabled.
  final bool enableBoldText;

  /// The type of color blindness to accommodate.
  final ColorBlindnessType colorBlindnessType;

  /// Creates a new instance of [AccessibilitySettings] with the given values.
  AccessibilitySettings copyWith({
    bool? enableHighContrast,
    bool? enableCustomTextScaling,
    double? textScaleFactor,
    double? minTextScale,
    double? maxTextScale,
    bool? enableHapticFeedback,
    bool? reduceMotion,
    double? animationSpeedFactor,
    bool? enableVoiceOver,
    bool? enableLargeText,
    bool? enableBoldText,
    ColorBlindnessType? colorBlindnessType,
  }) {
    return AccessibilitySettings(
      enableHighContrast: enableHighContrast ?? this.enableHighContrast,
      enableCustomTextScaling:
          enableCustomTextScaling ?? this.enableCustomTextScaling,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      minTextScale: minTextScale ?? this.minTextScale,
      maxTextScale: maxTextScale ?? this.maxTextScale,
      enableHapticFeedback: enableHapticFeedback ?? this.enableHapticFeedback,
      reduceMotion: reduceMotion ?? this.reduceMotion,
      animationSpeedFactor: animationSpeedFactor ?? this.animationSpeedFactor,
      enableVoiceOver: enableVoiceOver ?? this.enableVoiceOver,
      enableLargeText: enableLargeText ?? this.enableLargeText,
      enableBoldText: enableBoldText ?? this.enableBoldText,
      colorBlindnessType: colorBlindnessType ?? this.colorBlindnessType,
    );
  }
}

/// An enum that represents the WCAG compliance levels.
enum WCAGLevel {
  /// WCAG AA level (4.5:1 contrast ratio for normal text).
  aa,

  /// WCAG AAA level (7:1 contrast ratio for normal text).
  aaa,
}

/// An enum that represents the types of color blindness.
enum ColorBlindnessType {
  /// No color blindness.
  none,

  /// Protanopia (red-blind).
  protanopia,

  /// Deuteranopia (green-blind).
  deuteranopia,

  /// Tritanopia (blue-blind).
  tritanopia,

  /// Protanomaly (red-weak).
  protanomaly,

  /// Deuteranomaly (green-weak).
  deuteranomaly,

  /// Tritanomaly (blue-weak).
  tritanomaly,

  /// Achromatopsia (complete color blindness).
  achromatopsia,
}

/// An enum that represents the types of haptic feedback.
enum HapticFeedbackType {
  /// Light impact feedback.
  lightImpact,

  /// Medium impact feedback.
  mediumImpact,

  /// Heavy impact feedback.
  heavyImpact,

  /// Selection click feedback.
  selectionClick,

  /// Vibrate feedback.
  vibrate,
}

/// An enum that represents the screen reader assertiveness levels.
enum Assertiveness {
  /// Polite announcement (waits for current speech to finish).
  polite,

  /// Assertive announcement (interrupts current speech).
  assertive,
}
