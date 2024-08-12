import 'package:flutter/material.dart';

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
  const PromptFavoriteSuccess();
}

class PromptFavoriteError extends PromptFavoriteState {
  final String message;

  const PromptFavoriteError(this.message);
}
