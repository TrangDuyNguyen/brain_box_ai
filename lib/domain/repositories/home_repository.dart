import '../../core/exception/result.dart';

abstract class HomeRepository {
  Future<Result> getListTopPrompt();
}
