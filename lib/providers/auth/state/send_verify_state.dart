import 'package:flutter/foundation.dart';

@immutable
abstract class SendVerifyState {
  const SendVerifyState();
}

class SendVerifyInitial extends SendVerifyState {
  const SendVerifyInitial();
}

class SendVerifyLoading extends SendVerifyState {
  const SendVerifyLoading();
}

class SendVerified extends SendVerifyState {
  const SendVerified();
}

class SendVerifyError extends SendVerifyState {
  final String message;

  const SendVerifyError(this.message);
}