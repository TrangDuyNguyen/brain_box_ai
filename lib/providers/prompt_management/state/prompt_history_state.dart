import 'package:flutter/material.dart';

@immutable
abstract class PromptHistoryState {
  const PromptHistoryState();
}

class PromptHistoryInitial extends PromptHistoryState {
  const PromptHistoryInitial();
}

class PromptHistoryLoading extends PromptHistoryState {
  const PromptHistoryLoading();
}

class PromptHistorySuccess extends PromptHistoryState {
  const PromptHistorySuccess();
}

class PromptHistoryError extends PromptHistoryState {
  final String message;

  const PromptHistoryError(this.message);
}