class SignUpFormState {
  final String fullName;
  final String email;
  final String password;

  SignUpFormState({
    this.fullName = '',
    this.email = '',
    this.password = '',
  });

  SignUpFormState copyWith({
    String? fullName,
    String? email,
    String? password,
  }) {
    return SignUpFormState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
