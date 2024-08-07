import 'package:brain_box_ai/providers/auth/state/auth_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/usecases/auth_use_case.dart';
import 'auth_provider.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthUseCase authUseCase;

  AuthNotifier(this.authUseCase) : super(const AuthInitial());

  Future<void> login(String email, String password) async {
    state = const AuthLoading();
    await Future.delayed(const Duration(seconds: 2));
    state = const Authenticated();
    final params = AuthParams(email: email, password: password);
    final result = await authUseCase.login(params);
    result.fold(
      (error) {
        state = AuthError(error.toString());
      },
      (data) {
        state = const Authenticated();
      },
    );
  }

  Future<void> logout() async {
    state = const AuthInitial();
  }
}

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final useCase = ref.read(authUseCaseProvider);
  return AuthNotifier(useCase);
});
