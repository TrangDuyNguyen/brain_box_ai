import 'package:flutter/material.dart';

import '../../../domain/entities/prompt_entity.dart';

@immutable
abstract class PromptFavoriteState {
  const PromptFavoriteState();
}

class PromptFavoriteInitial extends PromptFavoriteState {
  const PromptFavoriteInitial();
}

class PromptFavoriteLoading extends PromptFavoriteState {
  const PromptFavoriteLoading();
}

class PromptFavoriteSuccess extends PromptFavoriteState {
  final List<PromptEntity> listPrompt;
  const PromptFavoriteSuccess(this.listPrompt);
}

class PromptFavoriteError extends PromptFavoriteState {
  final String message;

  const PromptFavoriteError(this.message);
}
