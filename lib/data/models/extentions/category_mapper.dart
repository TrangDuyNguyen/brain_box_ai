import 'package:brain_box_ai/data/models/category_model.dart';
import 'package:brain_box_ai/domain/entities/search/category_entity.dart';

import 'base_mapper_model.dart';

class CategoryMapper extends MapperModel<CategoryModel, CategoryEntity> {
  @override
  CategoryEntity fromDTO(CategoryModel dto) {
    return CategoryEntity(
        id: dto.id,
        name: dto.name
    );
  }

  @override
  CategoryModel toDTO(CategoryEntity model) {
    return CategoryModel(
      id: model.id,
      name: model.name,
    );
  }
}
