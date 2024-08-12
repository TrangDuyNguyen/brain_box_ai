import 'package:brain_box_ai/core/exception/result.dart';

import 'package:brain_box_ai/core/usecases/usecase.dart';
import '../repositories/prompt_management_repository.dart';

class PromptManagementUseCase implements UseCase<void, PromptManagementParams> {
  // TODO: implement the output of your PromptManagementUseCase
  final PromptManagementRepository repository;

  PromptManagementUseCase(this.repository);

  @override
  Future<Result> call(PromptManagementParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

  Future<Result> getListHistoryPrompt(PromptManagementParams params) {
    return repository.getListHistoryPrompt();
  }

  Future<Result> getListFavoritePrompt(PromptManagementParams params) {
    return repository.getListFavoritePrompt();
  }

  Future<Result> getListSavedPrompt(PromptManagementParams params) {
    return repository.getListSavedPrompt();
  }
}

class PromptManagementParams {
  // TODO: implement your PromptManagementParams
  const PromptManagementParams();
}
