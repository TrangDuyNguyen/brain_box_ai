import 'package:brain_box_ai/data/datasources/prompt_datasource.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repositories/prompt_repository_impl.dart';
import '../../domain/repositories/prompt_repository.dart';
import '../../domain/usecases/prompt_use_case.dart';

final promptDataSourceProvider = Provider<PromptDatasource>((ref) {
  return PromptDatasourceImpl();
});

// Repository Provider
final promptRepositoryProvider = Provider<PromptRepository>((ref) {
  final dataSource = ref.read(promptDataSourceProvider);
  return PromptRepositoryImpl(dataSource);
});

// UseCase Provider
final promptUseCaseProvider = Provider<PromptUseCase>((ref) {
  final repository = ref.read(promptRepositoryProvider);
  return PromptUseCase(repository);
});