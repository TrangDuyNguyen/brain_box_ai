import 'package:flutter/foundation.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class Authenticated extends AuthState {
  const Authenticated();
}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);
}

class Unauthenticated extends AuthState {
  const Unauthenticated();
}
