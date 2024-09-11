import 'package:brain_box_ai/core/exception/result.dart';
import 'package:brain_box_ai/core/usecases/usecase.dart';
import 'package:brain_box_ai/domain/entities/prompt_entity.dart';
import 'package:brain_box_ai/domain/repositories/prompt_repository.dart';

class PromptUseCase implements UseCase<List<PromptEntity>, PromptParam> {

  final PromptRepository repository;

  PromptUseCase(this.repository);

  @override
  Future<Result> call(PromptParam params) {
    return repository.getPromptAll();
  }

}

class PromptParam {

}

