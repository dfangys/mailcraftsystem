import 'package:flutter/material.dart';

/// Responsive layout utilities for adaptive UI design
class ResponsiveLayout {
  /// Screen size breakpoints
  static const double mobileBreakpoint = 600;

  /// Screen size breakpoints
  static const double tabletBreakpoint = 1024;

  /// Screen size breakpoints
  static const double desktopBreakpoint = 1440;

  /// Check if the current screen is mobile size
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  /// Check if the current screen is tablet size
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  /// Check if the current screen is desktop size
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }

  /// Get the appropriate number of columns for a grid based on screen size
  static int getGridColumns(
    BuildContext context, {
    int mobileColumns = 1,
    int tabletColumns = 2,
    int desktopColumns = 3,
  }) {
    if (isMobile(context)) return mobileColumns;
    if (isTablet(context)) return tabletColumns;
    return desktopColumns;
  }

  /// Get responsive padding based on screen size
  static EdgeInsets getResponsivePadding(
    BuildContext context, {
    EdgeInsets? mobile,
    EdgeInsets? tablet,
    EdgeInsets? desktop,
  }) {
    if (isMobile(context)) return mobile ?? const EdgeInsets.all(16);
    if (isTablet(context)) return tablet ?? const EdgeInsets.all(24);
    return desktop ?? const EdgeInsets.all(32);
  }

  /// Get responsive font size based on screen size
  static double getResponsiveFontSize(
    BuildContext context, {
    double mobileSize = 14,
    double tabletSize = 16,
    double desktopSize = 18,
  }) {
    if (isMobile(context)) return mobileSize;
    if (isTablet(context)) return tabletSize;
    return desktopSize;
  }

  /// Get responsive spacing based on screen size
  static double getResponsiveSpacing(
    BuildContext context, {
    double mobileSpacing = 8,
    double tabletSpacing = 12,
    double desktopSpacing = 16,
  }) {
    if (isMobile(context)) return mobileSpacing;
    if (isTablet(context)) return tabletSpacing;
    return desktopSpacing;
  }

  /// Build responsive widget based on screen size
  static Widget responsive(
    BuildContext context, {
    required Widget mobile,
    Widget? tablet,
    Widget? desktop,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet ?? mobile;
    return desktop ?? tablet ?? mobile;
  }

  /// Get responsive width constraint
  static double getMaxWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > desktopBreakpoint) {
      return desktopBreakpoint;
    }
    return screenWidth;
  }

  /// Get responsive card elevation
  static double getCardElevation(BuildContext context) {
    if (isMobile(context)) return 2;
    if (isTablet(context)) return 4;
    return 6;
  }

  /// Get responsive border radius
  static BorderRadius getResponsiveBorderRadius(BuildContext context) {
    if (isMobile(context)) return BorderRadius.circular(8);
    if (isTablet(context)) return BorderRadius.circular(12);
    return BorderRadius.circular(16);
  }
}

/// Responsive widget that adapts to screen size
class ResponsiveWidget extends StatelessWidget {
  /// Creates a responsive widget
  const ResponsiveWidget({
    required this.mobile,
    super.key,
    this.tablet,
    this.desktop,
  });

  /// Widget to show on mobile screens
  final Widget mobile;

  /// Widget to show on tablet screens (defaults to mobile if not provided)
  final Widget? tablet;

  /// Widget to show on desktop screens (defaults to tablet or mobile if not provided)
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout.responsive(
      context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }
}

/// Responsive container with adaptive constraints
class ResponsiveContainer extends StatelessWidget {
  /// Creates a responsive container
  const ResponsiveContainer({
    required this.child,
    super.key,
    this.maxWidth,
    this.padding,
    this.margin,
  });

  /// Child widget
  final Widget child;

  /// Maximum width constraint
  final double? maxWidth;

  /// Container padding
  final EdgeInsets? padding;

  /// Container margin
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? ResponsiveLayout.getMaxWidth(context),
      ),
      padding: padding ?? ResponsiveLayout.getResponsivePadding(context),
      margin: margin,
      child: child,
    );
  }
}

/// Responsive grid view with adaptive columns
class ResponsiveGridView extends StatelessWidget {
  /// Creates a responsive grid view
  const ResponsiveGridView({
    required this.children,
    super.key,
    this.mobileColumns = 1,
    this.tabletColumns = 2,
    this.desktopColumns = 3,
    this.crossAxisSpacing = 16,
    this.mainAxisSpacing = 16,
    this.childAspectRatio = 1.0,
    this.shrinkWrap = false,
    this.physics,
  });

  /// Grid children
  final List<Widget> children;

  /// Number of columns on mobile
  final int mobileColumns;

  /// Number of columns on tablet
  final int tabletColumns;

  /// Number of columns on desktop
  final int desktopColumns;

  /// Cross axis spacing
  final double crossAxisSpacing;

  /// Main axis spacing
  final double mainAxisSpacing;

  /// Child aspect ratio
  final double childAspectRatio;

  /// Whether to shrink wrap
  final bool shrinkWrap;

  /// Scroll physics
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    final columns = ResponsiveLayout.getGridColumns(
      context,
      mobileColumns: mobileColumns,
      tabletColumns: tabletColumns,
      desktopColumns: desktopColumns,
    );

    return GridView.count(
      crossAxisCount: columns,
      crossAxisSpacing: crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing,
      childAspectRatio: childAspectRatio,
      shrinkWrap: shrinkWrap,
      physics: physics,
      children: children,
    );
  }
}

/// Responsive text widget with adaptive font sizes
class ResponsiveText extends StatelessWidget {
  /// Creates a responsive text widget
  const ResponsiveText(
    this.text, {
    super.key,
    this.style,
    this.mobileSize,
    this.tabletSize,
    this.desktopSize,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  /// Text content
  final String text;

  /// Base text style
  final TextStyle? style;

  /// Font size on mobile
  final double? mobileSize;

  /// Font size on tablet
  final double? tabletSize;

  /// Font size on desktop
  final double? desktopSize;

  /// Text alignment
  final TextAlign? textAlign;

  /// Maximum lines
  final int? maxLines;

  /// Text overflow
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final responsiveFontSize = ResponsiveLayout.getResponsiveFontSize(
      context,
      mobileSize: mobileSize ?? 14,
      tabletSize: tabletSize ?? 16,
      desktopSize: desktopSize ?? 18,
    );

    return Text(
      text,
      style: (style ?? Theme.of(context).textTheme.bodyMedium)?.copyWith(
        fontSize: responsiveFontSize,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

