import 'package:brain_box_ai/providers/auth/send_verify_provider.dart';
import 'package:brain_box_ai/providers/auth/state/send_verify_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/usecases/auth_use_case.dart';

class SendVerifyNotifier extends StateNotifier<SendVerifyState> {
  final AuthUseCase authUseCase;

  SendVerifyNotifier(this.authUseCase) : super(const SendVerifyInitial());

  Future<void> sendVerify(String email) async {
    state = const SendVerifyLoading();
    final result = await authUseCase.sendVerify(email);
    result.fold(
      (error) {
        state = SendVerifyError(error.toString());
      },
      (data) {
        state = const SendVerified();
      },
    );
  }
}

final verifyNotifierProvider =
    StateNotifierProvider<SendVerifyNotifier, SendVerifyState>((ref) {
  final useCase = ref.read(sendVerifyUseCaseProvider);
  return SendVerifyNotifier(useCase);
});
