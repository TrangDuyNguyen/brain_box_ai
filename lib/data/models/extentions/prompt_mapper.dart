import '../../../domain/entities/prompt_entity.dart';
import '../prompt_model.dart';
import 'category_mapper.dart';

extension PromptModelToEntity on PromptModel {
  PromptEntity toEntity() {
    return PromptEntity(
      id: id.toString(),
      title: title,
      content: content,
      category: CategoryMapper().fromDTO(category),
      like: false,
      rate: rate,
      save: true,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.now(),
    );
  }
}

extension PromptModelListToEntityList on List<PromptModel> {
  List<PromptEntity> toEntityList() {
    return map((model) => model.toEntity()).toList();
  }
}
//
// extension PromptHistoryModelToEntity on PromptHistoryModel {
//   PromptEntity toEntity() {
//     return PromptEntity(
//       id: id.toString(),
//       title: title,
//       content: content,
//       category: category,
//       like: false,
//       rate: rate,
//       save: true,
//       createdAt: DateTime.parse(createdAt),
//       updatedAt: DateTime.now(),
//     );
//   }
// }
//
// extension PromptHistoryModelListToEntityList on List<PromptHistoryModel> {
//   List<PromptEntity> toEntityList() {
//     return map((model) => model.toEntity()).toList();
//   }
// }
//
// extension PromptFavoriteModelToEntity on PromptFavoriteModel {
//   PromptEntity toEntity() {
//     return PromptEntity(
//       id: id.toString(),
//       title: title,
//       content: content,
//       category: category,
//       like: false,
//       rate: rate,
//       save: true,
//       createdAt: DateTime.parse(createdAt),
//       updatedAt: DateTime.now(),
//     );
//   }
// }
//
// extension PromptFavoriteModelListToEntityList on List<PromptFavoriteModel> {
//   List<PromptEntity> toEntityList() {
//     return map((model) => model.toEntity()).toList();
//   }
// }
//
// extension PromptSavedModelToEntity on PromptSavedModel {
//   PromptEntity toEntity() {
//     return PromptEntity(
//       id: id.toString(),
//       title: title,
//       content: content,
//       category: category,
//       like: false,
//       rate: rate,
//       save: true,
//       createdAt: DateTime.parse(createdAt),
//       updatedAt: DateTime.now(),
//     );
//   }
// }
//
// extension PromptSavedModelListToEntityList on List<PromptSavedModel> {
//   List<PromptEntity> toEntityList() {
//     return map((model) => model.toEntity()).toList();
//   }
// }
//
// extension PromptTopModelToEntity on PromptTopModel {
//   PromptEntity toEntity() {
//     return PromptEntity(
//       id: id.toString(),
//       title: title,
//       content: content,
//       category: category,
//       like: false,
//       rate: rate,
//       save: true,
//       createdAt: DateTime.parse(createdAt),
//       updatedAt: DateTime.now(),
//     );
//   }
// }
//
// extension PromptTopModelListToEntityList on List<PromptTopModel> {
//   List<PromptEntity> toEntityList() {
//     return map((model) => model.toEntity()).toList();
//   }
// }
//
// extension PromptSearchResultModelToEntity on PromptSearchResultModel {
//   PromptEntity toEntity() {
//     return PromptEntity(
//       id: id.toString(),
//       title: title,
//       content: content,
//       category: category,
//       like: false,
//       rate: rate,
//       save: true,
//       createdAt: DateTime.parse(createdAt),
//       updatedAt: DateTime.now(),
//     );
//   }
// }
//
// extension PromptSearchResultModelListToEntityList on List<PromptFavoriteModel> {
//   List<PromptEntity> toEntityList() {
//     return map((model) => model.toEntity()).toList();
//   }
// }
