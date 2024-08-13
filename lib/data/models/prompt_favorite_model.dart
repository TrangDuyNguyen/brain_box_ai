import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/prompt_favorite_model.freezed.dart';

part 'gen/prompt_favorite_model.g.dart';

@unfreezed
class PromptFavoriteModel with _$PromptFavoriteModel {
  factory PromptFavoriteModel({
    required String id,
    required String title,
    required String content,
    required String category,
    required String createdAt,
  }) = _PromptFavoriteModel;

  factory PromptFavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$PromptFavoriteModelFromJson(json);
}