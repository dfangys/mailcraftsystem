import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:mailcraftsystem/core/error/failures.dart';

/// Reusable error widget
class AppErrorWidget extends StatelessWidget {
  /// Creates an error widget
  const AppErrorWidget({
    super.key,
    required this.failure,
    this.onRetry,
  });
  
  /// The failure to display
  final Failure failure;
  
  /// Callback for retry action
  final VoidCallback? onRetry;
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              HugeIcons.strokeRoundedAlert02,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Oops! Something went wrong',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              failure.userMessage,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(HugeIcons.strokeRoundedRefresh),
                label: const Text('Try Again'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
