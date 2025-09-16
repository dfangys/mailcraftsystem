import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/core/env/env_config.dart';
import 'package:mailcraftsystem/features/auth/presentation/controllers/auth_controller.dart';
import 'package:mailcraftsystem/shared/widgets/app_button.dart';
import 'package:mailcraftsystem/shared/widgets/error_widget.dart';
import 'package:pinput/pinput.dart';

/// OTP verification screen
class OtpScreen extends ConsumerStatefulWidget {
  /// Creates an OTP verification screen
  const OtpScreen({
    required this.email,
    super.key,
  });

  /// The email address for OTP verification
  final String email;

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  late int _otpLength;
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _otpLength = EnvConfig.otpLength;
  }

  @override
  void dispose() {
    _otpController.dispose();
    _otpFocusNode.dispose();
    super.dispose();
  }

  String get _otpCode {
    return _otpController.text;
  }

  void _handleOtpSubmit() {
    if (_otpCode.length == _otpLength) {
      ref
          .read(authControllerProvider.notifier)
          .verifyOtp(widget.email, _otpCode);
    }
  }

  void _handleResendOtp() {
    ref.read(authControllerProvider.notifier).resendOtp();
  }


  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Listen for navigation events
    ref.listen<AuthState>(authControllerProvider, (previous, next) {
      if (next.isAuthenticated) {
        context.go('/home');
      }
    });

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Icon and title
                  Icon(
                    Icons.email,
                    size: 64,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Verify Your Identity',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
            'Enter the $_otpLength-digit code sent to your email',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),

                  // Error display
                  if (authState.error != null) ...[
                    AppErrorWidget(
                      failure: Failure.auth(message: authState.error!),
                      onRetry: _handleOtpSubmit,
                    ),
                    const SizedBox(height: 24),
                  ],

                  // OTP input fields
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Pinput(
                      length: _otpLength,
                      controller: _otpController,
                      focusNode: _otpFocusNode,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsUserConsentApi,
                      listenForMultipleSmsOnAndroid: true,
                      onCompleted: (String code) {
                        ref
                            .read(authControllerProvider.notifier)
                            .verifyOtp(widget.email, code);
                      },
                      defaultPinTheme: PinTheme(
                        width: 48,
                        height: 56,
                        textStyle: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest
                              .withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: colorScheme.outline),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 48,
                        height: 56,
                        textStyle: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest
                              .withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: colorScheme.primary,
                            width: 2,
                          ),
                        ),
                      ),
                      separatorBuilder: (index) => const SizedBox(width: 10),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Verify button
                  AppButton(
                    text: 'Verify Code',
                    onPressed:
                        authState.isLoading || _otpCode.length != _otpLength
                            ? null
                            : _handleOtpSubmit,
                    isLoading: authState.isLoading,
                    style: AppButtonStyle.primary,
                  ),
                  const SizedBox(height: 24),

                  // Resend code
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive the code? ",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      TextButton(
                        onPressed:
                            authState.isLoading ? null : _handleResendOtp,
                        child: Text(
                          'Resend',
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Help text
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest
                          .withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: colorScheme.outline.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.email,
                          size: 20,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Check your email for the verification code. '
                            'It may take a few minutes to arrive.',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
