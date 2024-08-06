import 'package:brain_box_ai/providers/auth/reset_provider.dart';
import 'package:brain_box_ai/providers/auth/state/reset_password_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/usecases/auth_use_case.dart';

class ResetNotifier extends StateNotifier<ResetPasswordState> {
  final AuthUseCase authUseCase;

  ResetNotifier(this.authUseCase) : super(const ResetInitial());

  Future<void> resetPassword(String newPassword) async {
    state = const ResetLoading();
    await Future.delayed(const Duration(seconds: 2));
    state = const ResetSuccess();
    final params = AuthParams(password: newPassword);
    final result = await authUseCase.forgotAccount(params);
    result.fold(
      (error) {
        state = ResetError(error.toString());
      },
      (data) {
        state = const ResetSuccess();
      },
    );
  }
}

final resetNotifierProvider =
    StateNotifierProvider<ResetNotifier, ResetPasswordState>((ref) {
  final useCase = ref.read(resetUseCaseProvider);
  return ResetNotifier(useCase);
});
