import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/prompt_saved_model.freezed.dart';

part 'gen/prompt_saved_model.g.dart';

@unfreezed
class PromptSavedModel with _$PromptSavedModel {
  factory PromptSavedModel({
    required String id,
    required String title,
    required String content,
    required String category,
    required int rate,
    required String createdAt,
  }) = _PromptSavedModel;

  factory PromptSavedModel.fromJson(Map<String, dynamic> json) =>
      _$PromptSavedModelFromJson(json);
}