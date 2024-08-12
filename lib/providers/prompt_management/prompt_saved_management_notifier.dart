import 'package:brain_box_ai/providers/prompt_management/state/prompt_saved_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/datasources/prompt_management_datasource.dart';
import '../../data/repositories/prompt_management_repository_impl.dart';
import '../../domain/repositories/prompt_management_repository.dart';
import '../../domain/usecases/prompt_management_use_case.dart';

class PromptSavedNotifier extends StateNotifier<PromptSavedState> {
  final PromptManagementUseCase useCase;

  PromptSavedNotifier(this.useCase) : super(const PromptSavedInitial()) {
    getListSavedPrompt();
  }

  Future<void> getListSavedPrompt() async {
    state = const PromptSavedLoading();
    await Future.delayed(const Duration(seconds: 3));
    state = const PromptSavedSuccess();
    const params = PromptManagementParams();
    final result = await useCase.getListSavedPrompt(params);
    result.fold(
          (error) {
        state = PromptSavedError(error.toString());
      },
          (data) {
        state = const PromptSavedSuccess();
      },
    );
  }
}

// DataSource Provider
final promptSavedDataSourceProvider =
Provider<PromptManagementDataSource>((ref) {
  return PromptManagementDataSourceImpl();
});

// Repository Provider
final promptSavedRepositoryProvider =
Provider<PromptManagementRepository>((ref) {
  final dataSource = ref.read(promptSavedDataSourceProvider);
  return PromptManagementRepositoryImpl(dataSource);
});

// UseCase Provider
final promptSavedUseCaseProvider = Provider<PromptManagementUseCase>((ref) {
  final repository = ref.read(promptSavedRepositoryProvider);
  return PromptManagementUseCase(repository);
});

final promptSavedNotifierProvider =
StateNotifierProvider<PromptSavedNotifier, PromptSavedState>((ref) {
  final useCase = ref.read(promptSavedUseCaseProvider);
  return PromptSavedNotifier(useCase);
});