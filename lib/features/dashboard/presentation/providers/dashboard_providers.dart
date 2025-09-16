import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailcraftsystem/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:mailcraftsystem/features/mailboxes/presentation/providers/mailbox_providers.dart';
import 'package:mailcraftsystem/features/auth/presentation/providers/auth_providers.dart';

final dashboardControllerProvider =
    StateNotifierProvider<DashboardController, DashboardState>((ref) {
  final mailboxRepo = ref.watch(mailboxRepositoryProvider);
  final messageRepo = ref.watch(messageRepositoryProvider);
  final authRepo = ref.watch(authRepositoryProvider);
  return DashboardController(mailboxRepo, messageRepo, authRepo);
});
