import 'package:brain_box_ai/data/datasources/prompt_management_datasource.dart';
import 'package:brain_box_ai/data/repositories/prompt_management_repository_impl.dart';
import 'package:brain_box_ai/domain/entities/prompt_entity.dart';
import 'package:brain_box_ai/domain/repositories/prompt_management_repository.dart';
import 'package:brain_box_ai/providers/prompt_management/state/prompt_history_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/usecases/prompt_management_use_case.dart';

class PromptHistoryNotifier extends StateNotifier<PromptHistoryState> {
  final PromptManagementUseCase useCase;

  PromptHistoryNotifier(this.useCase) : super(const PromptHistoryInitial()) {
    getListHistoryPrompt();
  }

  Future<void> getListHistoryPrompt() async {
    state = const PromptHistoryLoading();
    await Future.delayed(const Duration(seconds: 3));
    const params = PromptManagementParams();
    final result = await useCase.getListHistoryPrompt(params);
    result.fold(
      (error) {
        state = PromptHistoryError(error.toString());
      },
      (data) {
        state = PromptHistorySuccess(data);
      },
    );
  }
}

// DataSource Provider
final promptHistoryDataSourceProvider =
    Provider<PromptManagementDataSource>((ref) {
  return PromptManagementDataSourceImpl();
});

// Repository Provider
final promptHistoryRepositoryProvider =
    Provider<PromptManagementRepository>((ref) {
  final dataSource = ref.read(promptHistoryDataSourceProvider);
  return PromptManagementRepositoryImpl(dataSource);
});

// UseCase Provider
final promptHistoryUseCaseProvider = Provider<PromptManagementUseCase>((ref) {
  final repository = ref.read(promptHistoryRepositoryProvider);
  return PromptManagementUseCase(repository);
});

final promptHistoryNotifierProvider =
    StateNotifierProvider<PromptHistoryNotifier, PromptHistoryState>((ref) {
  final useCase = ref.read(promptHistoryUseCaseProvider);
  return PromptHistoryNotifier(useCase);
});
