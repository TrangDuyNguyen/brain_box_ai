import 'package:flutter/material.dart';

import '../../../domain/entities/prompt_entity.dart';

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
  final List<PromptEntity> listPrompt;
  const PromptHistorySuccess(this.listPrompt);
}

class PromptHistoryError extends PromptHistoryState {
  final String message;

  const PromptHistoryError(this.message);
}
