# Accessibility Guide

## Overview

MailCraftSystem is designed with accessibility as a core principle, ensuring that all users, regardless of their abilities, can effectively use the email client. This guide outlines our comprehensive approach to accessibility, compliance standards, and implementation details.

## Accessibility Standards

### WCAG 2.1 AA Compliance
We adhere to the Web Content Accessibility Guidelines (WCAG) 2.1 Level AA standards:

#### Perceivable
- **Text Alternatives**: All images and icons have descriptive alt text
- **Captions and Transcripts**: Audio content includes captions
- **Adaptable Content**: Information can be presented in different ways
- **Distinguishable**: Content is easy to see and hear

#### Operable
- **Keyboard Accessible**: All functionality available via keyboard
- **No Seizures**: Content doesn't cause seizures or physical reactions
- **Navigable**: Users can navigate and find content
- **Input Modalities**: Content is accessible via various input methods

#### Understandable
- **Readable**: Text is readable and understandable
- **Predictable**: Web pages appear and operate predictably
- **Input Assistance**: Users are helped to avoid and correct mistakes

#### Robust
- **Compatible**: Content works with assistive technologies
- **Future-proof**: Content remains accessible as technologies advance

## Screen Reader Support

### Semantic Structure
Proper semantic markup ensures screen readers can navigate content effectively:

```dart
class AccessibleEmailList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Email list',
      hint: 'Swipe to navigate between emails',
      child: ListView.builder(
        itemCount: emails.length,
        itemBuilder: (context, index) {
          final email = emails[index];
          return Semantics(
            label: 'Email from ${email.sender}',
            hint: 'Subject: ${email.subject}. ${email.isRead ? 'Read' : 'Unread'}. Double tap to open.',
            button: true,
            onTap: () => _openEmail(email),
            child: EmailListItem(email: email),
          );
        },
      ),
    );
  }
}
```

### Screen Reader Announcements
Important events are announced to screen readers:

```dart
class AccessibilityService {
  void announceEmailReceived(int count) {
    final message = count == 1 
        ? 'You have 1 new email'
        : 'You have $count new emails';
    
    SemanticsService.announce(
      message,
      TextDirection.ltr,
      assertiveness: Assertiveness.polite,
    );
  }
  
  void announceEmailSent() {
    SemanticsService.announce(
      'Email sent successfully',
      TextDirection.ltr,
      assertiveness: Assertiveness.assertive,
    );
  }
  
  void announceError(String error) {
    SemanticsService.announce(
      'Error: $error',
      TextDirection.ltr,
      assertiveness: Assertiveness.assertive,
    );
  }
}
```

### VoiceOver and TalkBack Integration
Platform-specific optimizations for screen readers:

```dart
class PlatformAccessibility {
  static Widget createAccessibleButton({
    required String label,
    required VoidCallback onPressed,
    String? hint,
    bool isDestructive = false,
  }) {
    return Semantics(
      label: label,
      hint: hint,
      button: true,
      enabled: true,
      onTap: onPressed,
      child: Platform.isIOS 
          ? _createIOSButton(label, onPressed, isDestructive)
          : _createAndroidButton(label, onPressed, isDestructive),
    );
  }
  
  static Widget _createIOSButton(String label, VoidCallback onPressed, bool isDestructive) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: isDestructive ? CupertinoColors.destructiveRed : null,
        ),
      ),
    );
  }
  
  static Widget _createAndroidButton(String label, VoidCallback onPressed, bool isDestructive) {
    return ElevatedButton(
      onPressed: onPressed,
      style: isDestructive 
          ? ElevatedButton.styleFrom(backgroundColor: Colors.red)
          : null,
      child: Text(label),
    );
  }
}
```

## Keyboard Navigation

### Focus Management
Logical focus order and keyboard navigation:

```dart
class AccessibleEmailCompose extends StatefulWidget {
  @override
  _AccessibleEmailComposeState createState() => _AccessibleEmailComposeState();
}

class _AccessibleEmailComposeState extends State<AccessibleEmailCompose> {
  final List<FocusNode> _focusNodes = [
    FocusNode(), // To field
    FocusNode(), // CC field
    FocusNode(), // BCC field
    FocusNode(), // Subject field
    FocusNode(), // Body field
    FocusNode(), // Send button
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // To field
          Focus(
            focusNode: _focusNodes[0],
            onKeyEvent: (node, event) => _handleKeyEvent(event, 0),
            child: TextField(
              decoration: const InputDecoration(labelText: 'To'),
              onSubmitted: (_) => _focusNext(1),
            ),
          ),
          
          // CC field
          Focus(
            focusNode: _focusNodes[1],
            onKeyEvent: (node, event) => _handleKeyEvent(event, 1),
            child: TextField(
              decoration: const InputDecoration(labelText: 'CC'),
              onSubmitted: (_) => _focusNext(2),
            ),
          ),
          
          // Subject field
          Focus(
            focusNode: _focusNodes[3],
            onKeyEvent: (node, event) => _handleKeyEvent(event, 3),
            child: TextField(
              decoration: const InputDecoration(labelText: 'Subject'),
              onSubmitted: (_) => _focusNext(4),
            ),
          ),
          
          // Body field
          Expanded(
            child: Focus(
              focusNode: _focusNodes[4],
              onKeyEvent: (node, event) => _handleKeyEvent(event, 4),
              child: TextField(
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          
          // Send button
          Focus(
            focusNode: _focusNodes[5],
            child: ElevatedButton(
              onPressed: _sendEmail,
              child: const Text('Send'),
            ),
          ),
        ],
      ),
    );
  }
  
  KeyEventResult _handleKeyEvent(KeyEvent event, int currentIndex) {
    if (event is KeyDownEvent) {
      // Tab navigation
      if (event.logicalKey == LogicalKeyboardKey.tab) {
        if (event.isShiftPressed) {
          _focusPrevious(currentIndex);
        } else {
          _focusNext(currentIndex + 1);
        }
        return KeyEventResult.handled;
      }
      
      // Escape to cancel
      if (event.logicalKey == LogicalKeyboardKey.escape) {
        _cancelCompose();
        return KeyEventResult.handled;
      }
      
      // Ctrl+Enter to send
      if (event.logicalKey == LogicalKeyboardKey.enter && 
          event.isControlPressed) {
        _sendEmail();
        return KeyEventResult.handled;
      }
    }
    
    return KeyEventResult.ignored;
  }
  
  void _focusNext(int index) {
    if (index < _focusNodes.length) {
      _focusNodes[index].requestFocus();
    }
  }
  
  void _focusPrevious(int index) {
    if (index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }
}
```

### Keyboard Shortcuts
Comprehensive keyboard shortcuts for power users:

```dart
class KeyboardShortcuts extends StatelessWidget {
  static const Map<String, String> shortcuts = {
    'Ctrl+N': 'New email',
    'Ctrl+R': 'Reply',
    'Ctrl+Shift+R': 'Reply all',
    'Ctrl+F': 'Forward',
    'Ctrl+D': 'Delete',
    'Ctrl+S': 'Save draft',
    'Ctrl+Enter': 'Send email',
    'Ctrl+F': 'Search',
    'Ctrl+1': 'Go to inbox',
    'Ctrl+2': 'Go to sent',
    'Ctrl+3': 'Go to drafts',
    'J': 'Next email',
    'K': 'Previous email',
    'U': 'Mark as unread',
    'I': 'Mark as read',
    'S': 'Star email',
    'A': 'Archive',
    'Delete': 'Delete email',
    'Escape': 'Close dialog',
  };
  
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyN):
            const NewEmailIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyR):
            const ReplyIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.shift, LogicalKeyboardKey.keyR):
            const ReplyAllIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyF):
            const ForwardIntent(),
        LogicalKeySet(LogicalKeyboardKey.keyJ):
            const NextEmailIntent(),
        LogicalKeySet(LogicalKeyboardKey.keyK):
            const PreviousEmailIntent(),
      },
      child: Actions(
        actions: {
          NewEmailIntent: CallbackAction<NewEmailIntent>(
            onInvoke: (intent) => _composeNewEmail(),
          ),
          ReplyIntent: CallbackAction<ReplyIntent>(
            onInvoke: (intent) => _replyToEmail(),
          ),
          // ... other actions
        },
        child: child,
      ),
    );
  }
}
```

## Visual Accessibility

### High Contrast Support
Automatic high contrast mode detection and implementation:

```dart
class HighContrastTheme {
  static ThemeData getHighContrastTheme(BuildContext context) {
    final isHighContrast = MediaQuery.of(context).highContrast;
    
    if (isHighContrast) {
      return ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          headline1: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            side: const BorderSide(color: Colors.white, width: 2),
          ),
        ),
      );
    }
    
    return ThemeData.light();
  }
}
```

### Color Contrast Compliance
Ensuring WCAG AA color contrast ratios:

```dart
class ColorContrastChecker {
  // WCAG AA requires 4.5:1 for normal text, 3:1 for large text
  static const double _normalTextRatio = 4.5;
  static const double _largeTextRatio = 3.0;
  
  static bool meetsWCAGAA(Color foreground, Color background, {bool isLargeText = false}) {
    final ratio = calculateContrastRatio(foreground, background);
    final requiredRatio = isLargeText ? _largeTextRatio : _normalTextRatio;
    return ratio >= requiredRatio;
  }
  
  static double calculateContrastRatio(Color color1, Color color2) {
    final luminance1 = color1.computeLuminance();
    final luminance2 = color2.computeLuminance();
    
    final lighter = math.max(luminance1, luminance2);
    final darker = math.min(luminance1, luminance2);
    
    return (lighter + 0.05) / (darker + 0.05);
  }
  
  static Color getAccessibleTextColor(Color backgroundColor) {
    final whiteLuminance = Colors.white.computeLuminance();
    final blackLuminance = Colors.black.computeLuminance();
    final bgLuminance = backgroundColor.computeLuminance();
    
    final whiteRatio = (math.max(whiteLuminance, bgLuminance) + 0.05) /
                      (math.min(whiteLuminance, bgLuminance) + 0.05);
    final blackRatio = (math.max(blackLuminance, bgLuminance) + 0.05) /
                      (math.min(blackLuminance, bgLuminance) + 0.05);
    
    return whiteRatio > blackRatio ? Colors.white : Colors.black;
  }
}
```

### Color Blindness Support
Alternative visual indicators for color-blind users:

```dart
class ColorBlindnessSupport {
  static Widget createAccessibleStatusIndicator({
    required EmailStatus status,
    required String label,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Color indicator
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: _getStatusColor(status),
            shape: _getStatusShape(status),
            border: Border.all(color: Colors.black, width: 1),
          ),
        ),
        const SizedBox(width: 4),
        // Text indicator
        Text(
          label,
          style: TextStyle(
            fontWeight: _getStatusFontWeight(status),
            decoration: _getStatusDecoration(status),
          ),
        ),
        // Icon indicator
        Icon(
          _getStatusIcon(status),
          size: 16,
          color: _getStatusColor(status),
        ),
      ],
    );
  }
  
  static Color _getStatusColor(EmailStatus status) {
    switch (status) {
      case EmailStatus.unread:
        return Colors.blue;
      case EmailStatus.read:
        return Colors.grey;
      case EmailStatus.important:
        return Colors.red;
      case EmailStatus.archived:
        return Colors.green;
    }
  }
  
  static BoxShape _getStatusShape(EmailStatus status) {
    switch (status) {
      case EmailStatus.unread:
        return BoxShape.circle;
      case EmailStatus.read:
        return BoxShape.rectangle;
      case EmailStatus.important:
        return BoxShape.circle;
      case EmailStatus.archived:
        return BoxShape.rectangle;
    }
  }
  
  static IconData _getStatusIcon(EmailStatus status) {
    switch (status) {
      case EmailStatus.unread:
        return Icons.fiber_manual_record;
      case EmailStatus.read:
        return Icons.check;
      case EmailStatus.important:
        return Icons.priority_high;
      case EmailStatus.archived:
        return Icons.archive;
    }
  }
}
```

## Text and Font Accessibility

### Dynamic Text Scaling
Support for system text scaling preferences:

```dart
class AccessibleText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  
  const AccessibleText(
    this.text, {
    Key? key,
    this.style,
    this.textAlign,
    this.maxLines,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final accessibilityService = AccessibilityService.instance;
    final scaleFactor = accessibilityService.getTextScaleFactor(context);
    
    return Text(
      text,
      style: style?.copyWith(
        fontSize: (style?.fontSize ?? 14) * scaleFactor,
        height: _getLineHeight(scaleFactor),
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
    );
  }
  
  double _getLineHeight(double scaleFactor) {
    // Adjust line height for better readability at larger scales
    if (scaleFactor > 1.5) {
      return 1.4;
    } else if (scaleFactor > 1.2) {
      return 1.3;
    } else {
      return 1.2;
    }
  }
}
```

### Font Choices
Accessible font selection and fallbacks:

```dart
class AccessibleFonts {
  static const List<String> accessibleFontFamilies = [
    'SF Pro Text', // iOS system font
    'Roboto', // Android system font
    'Segoe UI', // Windows system font
    'Arial', // Fallback
    'Helvetica', // Fallback
    'sans-serif', // Generic fallback
  ];
  
  static TextStyle getAccessibleTextStyle({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: accessibleFontFamilies.first,
      fontFamilyFallback: accessibleFontFamilies.skip(1).toList(),
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: 0.5, // Improved readability
      height: 1.4, // Better line spacing
    );
  }
  
  static TextStyle getHeadingStyle({
    double fontSize = 24,
    FontWeight fontWeight = FontWeight.bold,
    Color? color,
  }) {
    return getAccessibleTextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ).copyWith(
      height: 1.2, // Tighter spacing for headings
    );
  }
}
```

## Motor Accessibility

### Touch Target Sizes
Ensuring adequate touch target sizes:

```dart
class AccessibleTouchTargets {
  static const double minimumTouchTargetSize = 44.0; // iOS HIG recommendation
  static const double recommendedTouchTargetSize = 48.0; // Material Design
  
  static Widget createAccessibleButton({
    required Widget child,
    required VoidCallback? onPressed,
    EdgeInsets? padding,
  }) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: recommendedTouchTargetSize,
        minHeight: recommendedTouchTargetSize,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding ?? const EdgeInsets.all(12),
          tapTargetSize: MaterialTapTargetSize.padded,
        ),
        child: child,
      ),
    );
  }
  
  static Widget createAccessibleIconButton({
    required IconData icon,
    required VoidCallback? onPressed,
    String? tooltip,
    double iconSize = 24,
  }) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: recommendedTouchTargetSize,
        minHeight: recommendedTouchTargetSize,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: iconSize),
        tooltip: tooltip,
        iconSize: iconSize,
        padding: const EdgeInsets.all(12),
      ),
    );
  }
}
```

### Gesture Alternatives
Providing alternatives to complex gestures:

```dart
class AccessibleGestures extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onSwipeLeft;
  final VoidCallback? onSwipeRight;
  
  const AccessibleGestures({
    Key? key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.onSwipeLeft,
    this.onSwipeRight,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      onPanEnd: (details) {
        final velocity = details.velocity.pixelsPerSecond;
        
        // Only trigger swipe if velocity is significant
        if (velocity.dx.abs() > 500) {
          if (velocity.dx > 0 && onSwipeRight != null) {
            onSwipeRight!();
          } else if (velocity.dx < 0 && onSwipeLeft != null) {
            onSwipeLeft!();
          }
        }
      },
      child: Semantics(
        onTap: onTap,
        onLongPress: onLongPress,
        customSemanticsActions: {
          if (onSwipeLeft != null)
            const CustomSemanticsAction(label: 'Swipe left'): onSwipeLeft!,
          if (onSwipeRight != null)
            const CustomSemanticsAction(label: 'Swipe right'): onSwipeRight!,
        },
        child: child,
      ),
    );
  }
}
```

## Cognitive Accessibility

### Clear Navigation
Consistent and predictable navigation patterns:

```dart
class AccessibleNavigation extends StatelessWidget {
  final List<NavigationItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  
  const AccessibleNavigation({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Main navigation',
      hint: 'Use tab to navigate between sections',
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        items: items.map((item) => BottomNavigationBarItem(
          icon: Semantics(
            label: '${item.label} tab',
            hint: currentIndex == items.indexOf(item) 
                ? 'Currently selected' 
                : 'Double tap to select',
            child: Icon(item.icon),
          ),
          label: item.label,
        )).toList(),
      ),
    );
  }
}
```

### Error Prevention and Recovery
Clear error messages and recovery options:

```dart
class AccessibleErrorHandling {
  static Widget createErrorMessage({
    required String error,
    VoidCallback? onRetry,
    VoidCallback? onDismiss,
  }) {
    return Semantics(
      label: 'Error message',
      hint: 'Error occurred: $error',
      liveRegion: true,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.error, color: Colors.red),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Error',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade800,
                    ),
                  ),
                ),
                if (onDismiss != null)
                  IconButton(
                    onPressed: onDismiss,
                    icon: const Icon(Icons.close),
                    tooltip: 'Dismiss error',
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              error,
              style: TextStyle(color: Colors.red.shade700),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Try Again'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
```

## Testing Accessibility

### Automated Testing
Accessibility testing in widget tests:

```dart
testWidgets('Email list is accessible', (WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(
    home: EmailListPage(emails: mockEmails),
  ));
  
  // Test semantic labels
  expect(find.bySemanticsLabel('Email list'), findsOneWidget);
  
  // Test keyboard navigation
  await tester.sendKeyEvent(LogicalKeyboardKey.tab);
  expect(tester.binding.focusManager.primaryFocus?.debugLabel, 
         contains('Email item'));
  
  // Test screen reader announcements
  final SemanticsHandle handle = tester.ensureSemantics();
  await tester.tap(find.byType(EmailListItem).first);
  
  // Verify semantic properties
  final semantics = tester.getSemantics(find.byType(EmailListItem).first);
  expect(semantics.label, isNotEmpty);
  expect(semantics.hint, isNotEmpty);
  
  handle.dispose();
});
```

### Manual Testing Checklist
- [ ] Screen reader navigation works correctly
- [ ] All interactive elements are keyboard accessible
- [ ] Color contrast meets WCAG AA standards
- [ ] Text scales properly up to 200%
- [ ] Touch targets are at least 44x44 points
- [ ] Error messages are announced to screen readers
- [ ] Focus indicators are visible
- [ ] Content is logical without CSS/styling

## Platform-Specific Considerations

### iOS Accessibility
VoiceOver and iOS-specific features:

```dart
class IOSAccessibility {
  static Widget createAccessibleCupertinoButton({
    required String label,
    required VoidCallback onPressed,
    bool isDestructive = false,
  }) {
    return Semantics(
      label: label,
      hint: isDestructive ? 'Warning: This action cannot be undone' : null,
      button: true,
      child: CupertinoButton(
        onPressed: onPressed,
        color: isDestructive ? CupertinoColors.destructiveRed : null,
        child: Text(label),
      ),
    );
  }
  
  // Support for iOS accessibility shortcuts
  static void configureIOSAccessibility() {
    // Enable accessibility shortcuts
    if (Platform.isIOS) {
      // Configure VoiceOver gestures
      // Configure Switch Control
      // Configure Voice Control
    }
  }
}
```

### Android Accessibility
TalkBack and Android-specific features:

```dart
class AndroidAccessibility {
  static Widget createAccessibleMaterialButton({
    required String label,
    required VoidCallback onPressed,
    bool isDestructive = false,
  }) {
    return Semantics(
      label: label,
      hint: isDestructive ? 'Warning: This action cannot be undone' : null,
      button: true,
      child: ElevatedButton(
        onPressed: onPressed,
        style: isDestructive 
            ? ElevatedButton.styleFrom(backgroundColor: Colors.red)
            : null,
        child: Text(label),
      ),
    );
  }
  
  // Support for Android accessibility services
  static void configureAndroidAccessibility() {
    if (Platform.isAndroid) {
      // Configure TalkBack
      // Configure Select to Speak
      // Configure Live Caption
    }
  }
}
```

## Accessibility Settings

### User Preferences
Allowing users to customize accessibility features:

```dart
class AccessibilitySettings extends StatefulWidget {
  @override
  _AccessibilitySettingsState createState() => _AccessibilitySettingsState();
}

class _AccessibilitySettingsState extends State<AccessibilitySettings> {
  late AccessibilityPreferences _preferences;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessibility Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('High Contrast'),
            subtitle: const Text('Increase color contrast for better visibility'),
            value: _preferences.highContrast,
            onChanged: (value) {
              setState(() {
                _preferences = _preferences.copyWith(highContrast: value);
              });
              _savePreferences();
            },
          ),
          
          SwitchListTile(
            title: const Text('Large Text'),
            subtitle: const Text('Increase text size throughout the app'),
            value: _preferences.largeText,
            onChanged: (value) {
              setState(() {
                _preferences = _preferences.copyWith(largeText: value);
              });
              _savePreferences();
            },
          ),
          
          ListTile(
            title: const Text('Text Scale Factor'),
            subtitle: Slider(
              value: _preferences.textScaleFactor,
              min: 0.8,
              max: 3.0,
              divisions: 22,
              label: '${(_preferences.textScaleFactor * 100).round()}%',
              onChanged: (value) {
                setState(() {
                  _preferences = _preferences.copyWith(textScaleFactor: value);
                });
                _savePreferences();
              },
            ),
          ),
          
          SwitchListTile(
            title: const Text('Reduce Motion'),
            subtitle: const Text('Minimize animations and transitions'),
            value: _preferences.reduceMotion,
            onChanged: (value) {
              setState(() {
                _preferences = _preferences.copyWith(reduceMotion: value);
              });
              _savePreferences();
            },
          ),
          
          SwitchListTile(
            title: const Text('Haptic Feedback'),
            subtitle: const Text('Provide tactile feedback for interactions'),
            value: _preferences.hapticFeedback,
            onChanged: (value) {
              setState(() {
                _preferences = _preferences.copyWith(hapticFeedback: value);
              });
              _savePreferences();
            },
          ),
        ],
      ),
    );
  }
}
```

This comprehensive accessibility guide ensures that MailCraftSystem is usable by everyone, regardless of their abilities or the assistive technologies they use.
