import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import '../core/logging/logger.dart';

/// Bootstrap the application with proper error handling and initialization
void bootstrap() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      
      // Load environment variables
      try {
        await dotenv.load(fileName: '.env');
      } catch (e) {
        // If .env file doesn't exist or is empty, load from .env.example
        try {
          await dotenv.load(fileName: '.env.example');
        } catch (e2) {
          // If neither file exists, continue with empty environment
          AppLogger.warning('No .env or .env.example file found, using default configuration');
        }
      }
      
      // Initialize logger
      AppLogger.init();
      
      // Set preferred orientations
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      
      // Run the app
      runApp(
        ProviderScope(
          child: const _MailCraftApp(),
        ),
      );
    },
    (error, stackTrace) {
      if (kDebugMode) {
        Logger().e('Uncaught error', error: error, stackTrace: stackTrace);
      }
      // In production, you might want to send this to a crash reporting service
    },
  );
}

/// Main application widget for MailCraft System (internal)
class _MailCraftApp extends ConsumerWidget {
  /// Creates a new instance of [_MailCraftApp]
  const _MailCraftApp();

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

/// Router provider for navigation configuration
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
});

/// Temporary splash screen for initial app loading
class SplashScreen extends StatelessWidget {
  /// Creates a splash screen
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.email, size: 64),
            SizedBox(height: 16),
            Text('MailCraft System', style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text('Enterprise Email Client'),
          ],
        ),
      ),
    );
  }
}

/// Temporary login screen placeholder
class LoginScreen extends StatelessWidget {
  /// Creates a login screen
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Login Screen - Coming Soon'),
      ),
    );
  }
}

/// Temporary home screen placeholder
class HomeScreen extends StatelessWidget {
  /// Creates a home screen
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home Screen - Coming Soon'),
      ),
    );
  }
}
