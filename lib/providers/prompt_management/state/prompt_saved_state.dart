import 'package:flutter/material.dart';

import '../../../domain/entities/prompt_entity.dart';

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
  final List<PromptEntity> listPrompt;
  const PromptSavedSuccess(this.listPrompt);
}

class PromptSavedError extends PromptSavedState {
  final String message;

  const PromptSavedError(this.message);
}
