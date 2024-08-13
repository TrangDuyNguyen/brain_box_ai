import 'package:flutter/cupertino.dart';

import '../../../domain/entities/prompt_entity.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeSuccess extends HomeState {
  final List<PromptEntity> listPrompt;
  const HomeSuccess(this.listPrompt);
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);
}