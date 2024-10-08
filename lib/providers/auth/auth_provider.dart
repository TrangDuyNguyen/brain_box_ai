import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/datasources/auth_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/auth_use_case.dart';

// DataSource Provider
final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSourceImpl();
});

// Repository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dataSource = ref.read(authDataSourceProvider);
  return AuthRepositoryImpl(dataSource);
});

// UseCase Provider
final authUseCaseProvider = Provider<AuthUseCase>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return AuthUseCase(repository);
});
