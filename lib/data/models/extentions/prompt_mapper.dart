import '../../../domain/entities/prompt_entity.dart';
import '../prompt_favorite_model.dart';
import '../prompt_history_model.dart';
import '../prompt_saved_model.dart';
import '../prompt_top_model.dart';

extension PromptHistoryModelToEntity on PromptHistoryModel {
  PromptEntity toEntity() {
    return PromptEntity(
      id: id.toString(),
      title: title,
      content: content,
      category: category,
      like: false,
      rate: 3,
      save: true,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.now(),
    );
  }
}

extension PromptHistoryModelListToEntityList on List<PromptHistoryModel> {
  List<PromptEntity> toEntityList() {
    return map((model) => model.toEntity()).toList();
  }
}

extension PromptFavoriteModelToEntity on PromptFavoriteModel {
  PromptEntity toEntity() {
    return PromptEntity(
      id: id.toString(),
      title: title,
      content: content,
      category: category,
      like: false,
      rate: 3,
      save: true,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.now(),
    );
  }
}

extension PromptFavoriteModelListToEntityList on List<PromptFavoriteModel> {
  List<PromptEntity> toEntityList() {
    return map((model) => model.toEntity()).toList();
  }
}

extension PromptSavedModelToEntity on PromptSavedModel {
  PromptEntity toEntity() {
    return PromptEntity(
      id: id.toString(),
      title: title,
      content: content,
      category: category,
      like: false,
      rate: 3,
      save: true,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.now(),
    );
  }
}

extension PromptSavedModelListToEntityList on List<PromptSavedModel> {
  List<PromptEntity> toEntityList() {
    return map((model) => model.toEntity()).toList();
  }
}

extension PromptTopModelToEntity on PromptTopModel {
  PromptEntity toEntity() {
    return PromptEntity(
      id: id.toString(),
      title: title,
      content: content,
      category: category,
      like: false,
      rate: 3,
      save: true,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.now(),
    );
  }
}

extension PromptTopModelListToEntityList on List<PromptTopModel> {
  List<PromptEntity> toEntityList() {
    return map((model) => model.toEntity()).toList();
  }
}
