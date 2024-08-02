import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/datasources/auth_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/auth_use_case.dart';

final sendVerifyDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSourceImpl();
});

// Repository Provider
final sendVerifyRepositoryProvider = Provider<AuthRepository>((ref) {
  final dataSource = ref.read(sendVerifyDataSourceProvider);
  return AuthRepositoryImpl(dataSource);
});

// UseCase Provider
final sendVerifyUseCaseProvider = Provider<AuthUseCase>((ref) {
  final repository = ref.read(sendVerifyRepositoryProvider);
  return AuthUseCase(repository);
});