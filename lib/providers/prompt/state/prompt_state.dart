import 'package:flutter/material.dart';

import '../../../domain/entities/prompt_entity.dart';

class PromptState {
  final List<PromptEntity> originalList;
  final List<PromptEntity> filteredList;
  final bool isLoading;
  final String error;

  const PromptState({
    this.originalList = const [],
    this.filteredList = const [],
    this.isLoading = false,
    this.error = '',
  });

  PromptState copyWith({
    List<PromptEntity>? originalList,
    List<PromptEntity>? filteredList,
    bool? isLoading,
    String? error,
  }) {
    return PromptState(
      originalList: originalList ?? this.originalList,
      filteredList: filteredList ?? this.filteredList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}