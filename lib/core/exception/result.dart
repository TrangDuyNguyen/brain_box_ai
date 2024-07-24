import 'package:dartz/dartz.dart';

import 'app_exception.dart';

class Result<T> {
  final Either<Exception, T> value;

  Result(this.value);

  // Either: Được sử dụng để biểu diễn một giá trị có thể là một trong hai kiểu khác nhau, thường là kết quả thành công hoặc lỗi.
  // Option: Được sử dụng để biểu diễn một giá trị có thể tồn tại hoặc không tồn tại (giống như Optional trong Java).
  // Task: Được sử dụng để biểu diễn các tác vụ không đồng bộ (asynchronous tasks).
  // Function Types: Bao gồm các kiểu hàm để xử lý các thao tác hàm cao cấp (higher-order functions).
  // Tuple: Được sử dụng để nhóm các giá trị lại với nhau mà không cần tạo ra một lớp mới.

  factory Result.errors(Exception error) {
    return Result<T>(left(error));
  }

  factory Result.success(T data) {
    return Result<T>(Right(data));
  }

  bool get isSuccess => value.isRight();
  bool get isError => value.isLeft();

  T? get data => value.fold((l) => null, (r) => r);
  T? getOrNull() {
    return data;
  }

  T getOrElse(T defaultValue) {
    return data ?? defaultValue;
  }

  Exception? getError() {
    return value.fold((l) => l, (r) => null);
  }

  Exception getErrorThrow() {
    return value.fold(
      (l) => l,
      (r) => throw ParseException(message: "No error"),
    );
  }

  Exception? get error => value.fold((l) => l, (r) => null);

  T getOrThrow() {
    return value.fold((l) => throw l, (r) => r);
  }

  // isSuccess: Trả về true nếu kết quả là thành công.
  // isError: Trả về true nếu kết quả là lỗi.
  // data: Trả về dữ liệu nếu thành công, ngược lại trả về null.
  // getOrNull(): Trả về dữ liệu nếu thành công, ngược lại trả về null.
  // getOrElse(T defaultValue): Trả về dữ liệu nếu thành công, ngược lại trả về giá trị mặc định.
  // getError(): Trả về lỗi nếu có, ngược lại trả về null.
  // getErrorThrow(): Trả về lỗi nếu có, ngược lại ném một ngoại lệ.
  // getOrThrow(): Trả về dữ liệu nếu thành công, ngược lại ném lỗi.

  newT fold<newT>(
    newT Function(Exception failure) error,
    newT Function(T data) success,
  ) {
    return value.fold(
      (l) => error(l),
      (r) => success(r),
    );
  }

  Result<newT> map<newT>(newT Function(T data) success) {
    if (isSuccess) {
      return Result<newT>.success(success(data as T));
    } else {
      return Result<newT>.errors(error!);
    }
  }

  static Future<Result<T>> call<T>(Future<T> Function() request) {
    return request()
        .then((value) => Result<T>.success(value))
        .catchError((error) => Result<T>.errors(error));
  }
}
