import 'package:brain_box_ai/providers/state/auth_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'auth_notifier.dart';
import 'auth_use_case_provider.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final useCase = ref.watch(authUseCaseProvider);
  return AuthNotifier(useCase);
});