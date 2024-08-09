import 'package:brain_box_ai/core/exception/result.dart';
import '../../core/usecases/usecase.dart';
import '../repositories/home_repository.dart';

class HomeUseCase implements UseCase<void, HomeParams> {
  // TODO: implement the output of your HomeUseCase
  final HomeRepository repository;

  HomeUseCase(this.repository);
  @override
  Future<Result> call(HomeParams params) {
    return repository.getListTopPrompt();
  }
}

class HomeParams {
  // TODO: implement your HomeParams
  const HomeParams();
}
