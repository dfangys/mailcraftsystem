import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:mailcraftsystem/app/bootstrap.dart';

/// Entry point of the MailCraft System application
void main() {
  bootstrap();
}

/// Main application widget for MailCraft System
class MailCraftApp extends ConsumerWidget {
  /// Creates a new instance of [MailCraftApp]
  const MailCraftApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'MailCraft System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      routerConfig: ref.watch(routerProvider),
    );
  }
}
