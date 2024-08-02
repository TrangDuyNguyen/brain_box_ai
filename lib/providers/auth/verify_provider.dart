import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/datasources/auth_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/auth_use_case.dart';

final verifyDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSourceImpl();
});

// Repository Provider
final verifyRepositoryProvider = Provider<AuthRepository>((ref) {
  final dataSource = ref.read(verifyDataSourceProvider);
  return AuthRepositoryImpl(dataSource);
});

// UseCase Provider
final verifyUseCaseProvider = Provider<AuthUseCase>((ref) {
  final repository = ref.read(verifyRepositoryProvider);
  return AuthUseCase(repository);
});
