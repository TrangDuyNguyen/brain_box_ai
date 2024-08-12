import '../../../domain/entities/prompt_entity.dart';
import '../prompt_history_model.dart';

extension PromptHistoryModelToEntity on PromptHistoryModel {
  PromptEntity toEntity() {
    return PromptEntity(
      id: id.toString(),
      title: title,
      content: content,
      category: category,
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
