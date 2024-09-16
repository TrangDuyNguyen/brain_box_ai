import 'package:brain_box_ai/data/datasources/review_datasource.dart';
import 'package:brain_box_ai/data/repositories/review_repository_impl.dart';
import 'package:brain_box_ai/domain/repositories/review_repository.dart';
import 'package:brain_box_ai/domain/usecases/review_use_case/review_get_list_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final reviewDataSourceProvider = Provider<ReviewDatasource>((ref) {
  return ReviewDatasourceImpl();
});

final reviewRepositoryProvider = Provider<ReviewRepository>((ref) {
  final datasource = ref.read(reviewDataSourceProvider);
  return ReviewRepositoryImpl(datasource);
});

final reviewUseCaseProvider = Provider<ReviewGetListUseCase>((ref){
  final repository = ref.read(reviewRepositoryProvider);
  return ReviewGetListUseCase(repository);
});
