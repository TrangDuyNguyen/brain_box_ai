import 'package:brain_box_ai/domain/entities/prompt_entity.dart';

import '../../core/exception/result.dart';

abstract class PromptRepository {
  Future<Result<List<PromptEntity>>> getPromptAll();
}