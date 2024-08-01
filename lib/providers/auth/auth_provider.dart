import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/datasources/auth_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';

final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSourceImpl();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dataSource = ref.watch(authDataSourceProvider);
  return AuthRepositoryImpl(dataSource);
});
