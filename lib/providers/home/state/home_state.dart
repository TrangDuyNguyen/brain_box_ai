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
  final List<PromptEntity> originalList; // The original list of prompts
  final List<PromptEntity> filteredList; // The filtered list of prompts
  const HomeSuccess({
    required this.originalList,
    required this.filteredList,
  });

  HomeSuccess copyWith({
    List<PromptEntity>? originalList,
    List<PromptEntity>? filteredList,
  }) {
    return HomeSuccess(
      originalList: originalList ?? this.originalList,
      filteredList: filteredList ?? this.filteredList,
    );
  }
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);
}
