import 'package:flutter/foundation.dart';

@immutable
abstract class VerifyState {
  const VerifyState();
}

class VerifyInitial extends VerifyState {
  const VerifyInitial();
}

class VerifyLoading extends VerifyState {
  const VerifyLoading();
}

class Verified extends VerifyState {
  const Verified();
}

class VerifyError extends VerifyState {
  final String message;

  const VerifyError(this.message);
}
