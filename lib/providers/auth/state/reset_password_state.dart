import 'package:flutter/foundation.dart';

@immutable
abstract class ResetPasswordState {
  const ResetPasswordState();
}

class ResetInitial extends ResetPasswordState {
  const ResetInitial();
}

class ResetLoading extends ResetPasswordState {
  const ResetLoading();
}

class ResetSuccess extends ResetPasswordState {
  const ResetSuccess();
}

class ResetError extends ResetPasswordState {
  final String message;

  const ResetError(this.message);
}
