import 'package:brain_box_ai/core/exception/result.dart';

abstract class UseCase<Output, Input> {
  Future<Result> call(Input params);
}
