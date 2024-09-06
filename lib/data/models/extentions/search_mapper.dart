import 'package:brain_box_ai/data/models/search_model.dart';
import 'package:brain_box_ai/domain/entities/search/search_entity.dart';

import 'base_mapper_model.dart';

class SearchMapper extends MapperModel<SearchModel, SearchEntity> {
  @override
  SearchEntity fromDTO(SearchModel dto) {
    return SearchEntity(
      id: dto.id,
      result: dto.result,
    );
  }

  @override
  SearchModel toDTO(SearchEntity model) {
    return SearchModel(
      id: model.id,
      result: model.result,
    );
  }
}