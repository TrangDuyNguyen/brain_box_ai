import 'package:brain_box_ai/data/repositories/user_session_repository_impl.dart';
import 'package:brain_box_ai/domain/repositories/user_session_repository.dart';
import 'package:brain_box_ai/domain/usecases/user_session_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/datasources/local/user_session_datasource.dart';

final userSessionDataSourceProvider = Provider<UserSessionLocalDatasource>((ref) {
  return UserSessionLocalDatasourceImp();
});

// Repository Provider
final userSessionRepositoryProvider =
Provider<UserSessionRepository>((ref) {
  final dataSource = ref.read(userSessionDataSourceProvider);
  return UserSessionRepositoryImp(dataSource);
});

// UseCase Provider
final userSessionUseCaseProvider = Provider<UserSessionUseCase>((ref) {
  final repository = ref.read(userSessionRepositoryProvider);
  return UserSessionUseCase(repository);
});