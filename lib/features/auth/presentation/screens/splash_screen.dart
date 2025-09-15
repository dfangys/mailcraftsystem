import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mailcraftsystem/features/auth/presentation/controllers/auth_controller.dart';
import 'package:mailcraftsystem/shared/widgets/loading_widget.dart';

/// Splash screen with enhanced branding and initialization
class SplashScreen extends ConsumerStatefulWidget {
  /// Creates a splash screen
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _slideAnimation;
  bool _hasInitialized = false;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
    ));

    _slideAnimation = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
    ));

    _animationController.forward();
  }

  Future<void> _initializeApp() async {
    if (_hasInitialized) return;
    _hasInitialized = true;
    
    // Check authentication status
    await ref.read(authControllerProvider.notifier).checkAuthStatus();
    
    // Wait for animations to complete
    await Future.delayed(const Duration(milliseconds: 2500));
    
    if (mounted) {
      final authState = ref.read(authControllerProvider);
      if (authState.isAuthenticated) {
        context.go('/dashboard');
      } else {
        context.go('/login');
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Listen to auth state changes
    ref.listen<AuthState>(authControllerProvider, (previous, next) {
      if (next.isAuthenticated && _hasInitialized) {
        context.go('/dashboard');
      } else if (next.error != null && _hasInitialized) {
        context.go('/login');
      }
    });

    // Initialize app on first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeApp();
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primary,
              colorScheme.primaryContainer,
              colorScheme.surface,
            ],
            stops: const [0.0, 0.6, 1.0],
          ),
        ),
        child: SafeArea(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo and branding
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: Column(
                          children: [
                            // App icon/logo
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                color: colorScheme.surface,
                                borderRadius: BorderRadius.circular(28),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 30,
                                    offset: const Offset(0, 15),
                                  ),
                                  BoxShadow(
                                    color: colorScheme.primary.withOpacity(0.3),
                                    blurRadius: 20,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.mail_outline_rounded,
                                size: 72,
                                color: colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: 32),
                            // App name
                            Text(
                              'MailCraft',
                              style: theme.textTheme.headlineLarge?.copyWith(
                                color: colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                fontSize: 36,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Tagline
                            Text(
                              'Enterprise Email Solution',
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: colorScheme.onPrimary.withOpacity(0.9),
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 100),
                    
                    // Loading section
                    Transform.translate(
                      offset: Offset(0, _slideAnimation.value),
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Column(
                          children: [
                            LoadingWidget(
                              size: LoadingSize.medium,
                              color: colorScheme.onPrimary,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Initializing secure connection...',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onPrimary.withOpacity(0.8),
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 60),
                    
                    // Version info
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Text(
                        'Version 1.0.0',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onPrimary.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
