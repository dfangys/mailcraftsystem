import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import 'package:mailcraftsystem/core/logging/logger.dart';
import 'package:mailcraftsystem/main.dart';

/// Bootstrap the application with proper error handling and initialization
void bootstrap() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      
      // Load environment variables
      await dotenv.load();
      
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
          child: const MailCraftApp(),
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

// Router provider - temporary implementation
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

// Temporary screens for navigation
class SplashScreen extends StatelessWidget {
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

class LoginScreen extends StatelessWidget {
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

class HomeScreen extends StatelessWidget {
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
