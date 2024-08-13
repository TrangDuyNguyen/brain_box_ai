import 'package:brain_box_ai/domain/entities/prompt_entity.dart';

import '../../core/exception/result.dart';

abstract class PromptManagementRepository {
  // TODO: implement your PromptManagementRepository
  Future<Result<List<PromptEntity>>> getListHistoryPrompt();
  Future<Result<List<PromptEntity>>> getListFavoritePrompt();
  Future<Result<List<PromptEntity>>> getListSavedPrompt();
}
