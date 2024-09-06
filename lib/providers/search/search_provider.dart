import 'package:brain_box_ai/data/datasources/search_datasource.dart';
import 'package:brain_box_ai/data/repositories/search_repository_impl.dart';
import 'package:brain_box_ai/domain/repositories/search_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchDataSourceProvider = Provider<SearchDatasource>((ref) {
  return SearchDatasourceImpl();
});

final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  final dataSource = ref.read(searchDataSourceProvider);
  return SearchRepositoryImpl(dataSource);
});
