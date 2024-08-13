import '../../core/exception/result.dart';
import '../entities/prompt_entity.dart';

abstract class HomeRepository {
  Future<Result<List<PromptEntity>>> getListTopPrompt();
}
