import 'package:brain_box_ai/providers/auth/register_provider.dart';
import 'package:brain_box_ai/providers/auth/state/register_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/usecases/auth_use_case.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  final AuthUseCase authUseCase;

  RegisterNotifier(this.authUseCase) : super(const RegisterInitial());

  Future<void> register(String email, String username, String password) async {
    state = const RegisterLoading();
    await Future.delayed(const Duration(seconds: 2));
    state = const RegisterSuccess();
    //state = const RegisterError("register fail");
    final params =
        AuthParams(email: email, username: username, password: password);
    final result = await authUseCase.createAccount(params);
    result.fold(
      (error) {
        state = RegisterError(error.toString());
      },
      (data) {
        state = const RegisterSuccess();
      },
    );
  }
}

final registerNotifierProvider =
    StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
  final useCase = ref.read(registerUseCaseProvider);
  return RegisterNotifier(useCase);
});
