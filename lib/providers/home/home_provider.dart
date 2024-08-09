import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/datasources/home_datasource.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/home_use_case.dart';

// DataSource Provider
final homeDataSourceProvider = Provider<HomeDataSource>((ref) {
  return HomeDataSourceImpl();
});

// Repository Provider
final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final dataSource = ref.read(homeDataSourceProvider);
  return HomeRepositoryImpl(dataSource);
});

// UseCase Provider
final homeUseCaseProvider = Provider<HomeUseCase>((ref) {
  final repository = ref.read(homeRepositoryProvider);
  return HomeUseCase(repository);
});
