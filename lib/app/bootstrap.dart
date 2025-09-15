import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:mailcraftsystem/core/logging/logger.dart';
import 'package:mailcraftsystem/features/account/presentation/screens/account_setup_screen.dart';
import 'package:mailcraftsystem/features/auth/presentation/screens/login_screen.dart';
import 'package:mailcraftsystem/features/auth/presentation/screens/otp_screen.dart';
import 'package:mailcraftsystem/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:mailcraftsystem/features/auth/presentation/screens/splash_screen.dart';
import 'package:mailcraftsystem/features/compose/presentation/screens/compose_screen.dart';
import 'package:mailcraftsystem/features/search/presentation/screens/search_screen.dart';
import 'package:mailcraftsystem/features/settings/presentation/screens/settings_screen.dart';
import 'package:mailcraftsystem/features/enterprise/presentation/screens/enterprise_features_screen.dart';
import 'package:mailcraftsystem/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:mailcraftsystem/features/mailboxes/presentation/screens/advanced_mailbox_screen.dart';
import 'package:mailcraftsystem/features/messages/presentation/screens/message_handling_screen.dart';
import 'package:mailcraftsystem/features/mailboxes/presentation/screens/mailbox_screen.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message.dart';
import 'package:mailcraftsystem/features/messages/presentation/screens/message_detail_screen.dart';

/// Bootstrap the application with proper error handling and initialization
void bootstrap() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      
      // Load environment variables
      try {
        await dotenv.load();
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
        const ProviderScope(
          child: MailCraftApp(),
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
        path: '/otp',
        builder: (context, state) {
          final email = state.uri.queryParameters['email'] ?? '';
          return OtpScreen(email: email);
        },
      ),
      GoRoute(
        path: '/reset-password',
        builder: (context, state) => const ResetPasswordScreen(),
      ),
      GoRoute(
        path: '/account-setup',
        builder: (context, state) => const AccountSetupScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const MailboxScreen(),
      ),
      GoRoute(
        path: '/mailbox',
        builder: (context, state) => const AdvancedMailboxScreen(),
      ),
      GoRoute(
        path: '/message-handling',
        builder: (context, state) => const MessageHandlingScreen(),
      ),
      GoRoute(
        path: '/message-detail',
        builder: (context, state) {
          final message = state.extra as Message?;
          if (message != null) {
            return MessageDetailScreen(message: message);
          }
          return const Scaffold(
            body: Center(
              child: Text('Error: Message not found'),
            ),
          );
        },
      ),
      GoRoute(
        path: '/compose',
        builder: (context, state) => const ComposeScreen(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: '/enterprise',
        builder: (context, state) => const EnterpriseFeaturesScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
});
