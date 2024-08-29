import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/prompt_history_model.freezed.dart';

part 'gen/prompt_history_model.g.dart';

@unfreezed
class PromptHistoryModel with _$PromptHistoryModel {
  factory PromptHistoryModel({
    required String id,
    required String title,
    required String content,
    required String category,
    required int rate,
    required String createdAt,
  }) = _PromptHistoryModel;

  factory PromptHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$PromptHistoryModelFromJson(json);
}
