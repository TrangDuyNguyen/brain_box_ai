import '../../core/exception/result.dart';

abstract class HomeDataSource {
  Future<Result> getListTopPrompt();
}

class HomeDataSourceImpl implements HomeDataSource {
  @override
  Future<Result> getListTopPrompt() {
    // TODO: implement getListTopPrompt
    throw UnimplementedError();
  }
  // TODO: implement your HomeDataSourceImpl
}
