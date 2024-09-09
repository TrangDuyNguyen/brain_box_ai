import 'package:brain_box_ai/domain/repositories/home_repository.dart';

import '../../core/exception/result.dart';
import '../../core/usecases/usecase.dart';

class CategoryUseCase implements UseCase<void, CategoryParam> {
  // TODO: implement the output of your HomeUseCase
  final HomeRepository repository;

  CategoryUseCase(this.repository);

  @override
  Future<Result> call(CategoryParam params) {
    return repository.getListCategory();
  }
}

class CategoryParam {
  // TODO: implement your HomeParams
  const CategoryParam();
}
