import 'package:flutter/material.dart';

/// A reusable loading widget with various styles
class LoadingWidget extends StatelessWidget {
  /// Creates a loading widget
  const LoadingWidget({
    super.key,
    this.message,
    this.size = LoadingSize.medium,
    this.color,
  });

  /// Creates a full screen loading widget
  const LoadingWidget.fullScreen({
    super.key,
    this.message,
    this.color,
  }) : size = LoadingSize.large;

  /// Creates a small inline loading widget
  const LoadingWidget.small({
    super.key,
    this.message,
    this.color,
  }) : size = LoadingSize.small;

  /// Optional loading message
  final String? message;

  /// Size of the loading indicator
  final LoadingSize size;

  /// Color of the loading indicator
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final indicatorSize = switch (size) {
      LoadingSize.small => 20.0,
      LoadingSize.medium => 32.0,
      LoadingSize.large => 48.0,
    };

    final indicator = SizedBox(
      width: indicatorSize,
      height: indicatorSize,
      child: CircularProgressIndicator(
        strokeWidth: size == LoadingSize.small ? 2 : 3,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? colorScheme.primary,
        ),
      ),
    );

    if (message == null) {
      return Center(child: indicator);
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          indicator,
          const SizedBox(height: 16),
          Text(
            message!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Loading sizes
enum LoadingSize {
  /// Small loading indicator (20px)
  small,

  /// Medium loading indicator (32px)
  medium,

  /// Large loading indicator (48px)
  large,
}

/// A shimmer loading effect for list items
class ShimmerLoading extends StatefulWidget {
  /// Creates a shimmer loading widget
  const ShimmerLoading({
    required this.child,
    super.key,
    this.isLoading = true,
  });

  /// The child widget to show when not loading
  final Widget child;

  /// Whether to show the shimmer effect
  final bool isLoading;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
  }

  @override
  void didUpdateWidget(ShimmerLoading oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoading != oldWidget.isLoading) {
      if (widget.isLoading) {
        _animationController.repeat();
      } else {
        _animationController.stop();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return LinearGradient(
          stops: const [
            0.4,
            0.5,
            0.6,
          ],
          colors: [
            colorScheme.surfaceContainerHighest,
            colorScheme.surface,
            colorScheme.surfaceContainerHighest,
          ],
        ).createShader(bounds);
      },
      child: widget.child,
    );
  }
}

/// A skeleton loading widget for list items
class SkeletonLoading extends StatelessWidget {
  /// Creates a skeleton loading widget
  const SkeletonLoading({
    super.key,
    this.height = 16,
    this.width,
    this.borderRadius = 4,
  });

  /// Height of the skeleton
  final double height;

  /// Width of the skeleton
  final double? width;

  /// Border radius of the skeleton
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}

/// A loading overlay that can be shown over content
class LoadingOverlay extends StatelessWidget {
  /// Creates a loading overlay
  const LoadingOverlay({
    required this.isLoading,
    required this.child,
    super.key,
    this.message,
    this.color,
  });

  /// Whether to show the loading overlay
  final bool isLoading;

  /// The child widget to show behind the overlay
  final Widget child;

  /// Optional loading message
  final String? message;

  /// Color of the overlay background
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          ColoredBox(
            color: color ?? Colors.black54,
            child: LoadingWidget(
              message: message,
              size: LoadingSize.large,
              color: Colors.white,
            ),
          ),
      ],
    );
  }
}

