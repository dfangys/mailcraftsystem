import 'package:flutter/material.dart';

/// Reusable loading widget
class LoadingWidget extends StatelessWidget {
  /// Creates a loading widget
  const LoadingWidget({
    super.key,
    this.message,
    this.size = 24,
  });
  
  /// Optional message to display below the loading indicator
  final String? message;
  
  /// Size of the loading indicator
  final double size;
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: const CircularProgressIndicator(),
          ),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
