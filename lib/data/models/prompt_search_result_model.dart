import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/prompt_search_result_model.freezed.dart';

part 'gen/prompt_search_result_model.g.dart';

@unfreezed
class PromptSearchResultModel with _$PromptSearchResultModel {
  factory PromptSearchResultModel({
    required String id,
    required String title,
    required String content,
    required String category,
    required int rate,
    required String createdAt,
  }) = _PromptSearchResultModell;

  factory PromptSearchResultModel.fromJson(Map<String, dynamic> json) =>
      _$PromptSearchResultModelFromJson(json);
}