import 'package:brain_box_ai/providers/auth/state/sign_up_form_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpFormNotifier extends StateNotifier<SignUpFormState> {
  SignUpFormNotifier() : super(SignUpFormState());

  void updateFullName(String fullName) {
    state = state.copyWith(fullName: fullName);
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }
}

final signUpFormProvider =
StateNotifierProvider<SignUpFormNotifier, SignUpFormState>(
      (ref) => SignUpFormNotifier(),
);