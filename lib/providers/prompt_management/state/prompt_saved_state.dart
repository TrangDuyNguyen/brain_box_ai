import 'package:flutter/material.dart';

@immutable
abstract class PromptSavedState {
  const PromptSavedState();
}

class PromptSavedInitial extends PromptSavedState {
  const PromptSavedInitial();
}

class PromptSavedLoading extends PromptSavedState {
  const PromptSavedLoading();
}

class PromptSavedSuccess extends PromptSavedState {
  const PromptSavedSuccess();
}

class PromptSavedError extends PromptSavedState {
  final String message;

  const PromptSavedError(this.message);
}
