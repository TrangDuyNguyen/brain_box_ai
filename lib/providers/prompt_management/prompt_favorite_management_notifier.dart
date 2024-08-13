import 'package:brain_box_ai/providers/prompt_management/state/prompt_favorite_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/datasources/prompt_management_datasource.dart';
import '../../data/repositories/prompt_management_repository_impl.dart';
import '../../domain/repositories/prompt_management_repository.dart';
import '../../domain/usecases/prompt_management_use_case.dart';

class PromptFavoriteNotifier extends StateNotifier<PromptFavoriteState> {
  final PromptManagementUseCase useCase;

  PromptFavoriteNotifier(this.useCase) : super(const PromptFavoriteInitial()) {
    getListFavoritePrompt();
  }

  Future<void> getListFavoritePrompt() async {
    state = const PromptFavoriteLoading();
    await Future.delayed(const Duration(seconds: 3));
    const params = PromptManagementParams();
    final result = await useCase.getListFavoritePrompt(params);
    result.fold(
          (error) {
        state = PromptFavoriteError(error.toString());
      },
          (data) {
        state = PromptFavoriteSuccess(data);
      },
    );
  }
}

// DataSource Provider
final promptFavoriteDataSourceProvider =
Provider<PromptManagementDataSource>((ref) {
  return PromptManagementDataSourceImpl();
});

// Repository Provider
final promptFavoriteRepositoryProvider =
Provider<PromptManagementRepository>((ref) {
  final dataSource = ref.read(promptFavoriteDataSourceProvider);
  return PromptManagementRepositoryImpl(dataSource);
});

// UseCase Provider
final promptFavoriteUseCaseProvider = Provider<PromptManagementUseCase>((ref) {
  final repository = ref.read(promptFavoriteRepositoryProvider);
  return PromptManagementUseCase(repository);
});

final promptFavoriteNotifierProvider =
StateNotifierProvider<PromptFavoriteNotifier, PromptFavoriteState>((ref) {
  final useCase = ref.read(promptFavoriteUseCaseProvider);
  return PromptFavoriteNotifier(useCase);
});