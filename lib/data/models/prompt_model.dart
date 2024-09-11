import 'package:brain_box_ai/data/models/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/prompt_model.freezed.dart';

part 'gen/prompt_model.g.dart';

@unfreezed
class PromptModel with _$PromptModel {
  factory PromptModel({
    required String id,
    required String title,
    required String content,
    required CategoryModel category,
    required int rate,
    required String createdAt,
  }) = _PromptModel;

  factory PromptModel.fromJson(Map<String, dynamic> json) =>
      _$PromptModelFromJson(json);
}