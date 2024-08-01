import 'package:brain_box_ai/providers/state/auth_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/usecases/auth_use_case.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthUseCase useCase;

  AuthNotifier(this.useCase) : super(const AuthInitial());

  Future<void> login(String email, String password) async {
    state = const AuthLoading();
    final params = AuthParams(email: email, password: password);
    final result = await useCase.login(params);
    // result.when(
    //   success: (data) {
    //     state = Authenticated();
    //   },
    //   error: (error) {
    //     state = AuthError(error.toString());
    //   },
    // );
  }

  Future<void> register(String email, String username, String password) async {
    state = const AuthLoading();
    final params = AuthParams(email: email, username: username, password: password);
    final result = await useCase.createAccount(params);
    // result.when(
    //   success: (data) {
    //     state = Authenticated();
    //   },
    //   error: (error) {
    //     state = AuthError(error.toString());
    //   },
    // );
  }

  Future<void> logout() async {
    state = const AuthInitial();

  }
}