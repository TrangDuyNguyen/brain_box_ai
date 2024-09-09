import 'package:brain_box_ai/domain/entities/search/category_entity.dart';

import '../../core/exception/result.dart';
import '../entities/prompt_entity.dart';

abstract class HomeRepository {
  Future<Result<List<PromptEntity>>> getListTopPrompt();
  Future<Result<List<CategoryEntity>>> getListCategory();
}
