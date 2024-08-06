import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/datasources/auth_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/auth_use_case.dart';

final resetDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSourceImpl();
});

// Repository Provider
final resetRepositoryProvider = Provider<AuthRepository>((ref) {
  final dataSource = ref.read(resetDataSourceProvider);
  return AuthRepositoryImpl(dataSource);
});

// UseCase Provider
final resetUseCaseProvider = Provider<AuthUseCase>((ref) {
  final repository = ref.read(resetRepositoryProvider);
  return AuthUseCase(repository);
});