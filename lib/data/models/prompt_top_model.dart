import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/prompt_top_model.freezed.dart';

part 'gen/prompt_top_model.g.dart';

@unfreezed
class PromptTopModel with _$PromptTopModel {
  factory PromptTopModel({
    required String id,
    required String title,
    required String content,
    required String category,
    required String createdAt,
  }) = _PromptTopModel;

  factory PromptTopModel.fromJson(Map<String, dynamic> json) =>
      _$PromptTopModelFromJson(json);
}
