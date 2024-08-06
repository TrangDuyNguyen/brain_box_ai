import 'package:brain_box_ai/providers/auth/state/verify_state.dart';
import 'package:brain_box_ai/providers/auth/verify_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/usecases/auth_use_case.dart';

class VerifyNotifier extends StateNotifier<VerifyState> {
  final AuthUseCase authUseCase;

  VerifyNotifier(this.authUseCase) : super(const VerifyInitial());

  Future<void> verifyAcc(String code) async {
    state = const VerifyLoading();
    await Future.delayed(const Duration(seconds: 2));
    state = const Verified();
    final result = await authUseCase.verifyAccount(code);
    result.fold(
      (error) {
        state = VerifyError(error.toString());
      },
      (data) {
        state = const Verified();
      },
    );
  }
}

final verifyNotifierProvider =
    StateNotifierProvider<VerifyNotifier, VerifyState>((ref) {
  final useCase = ref.read(verifyUseCaseProvider);
  return VerifyNotifier(useCase);
});
