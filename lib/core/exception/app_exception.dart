import 'dart:io';

class AppException implements Exception {
  final String? message;
  final Object? data;
  final StackTrace? stackTrace;

  AppException([this.message, this.data, this.stackTrace]);

  static AppException fromError(Object e) {
    if (e is AppException) {
      return e;
    } else {
      return AppException(
        e.toString(),
        e,
        StackTrace.current,
      );
    }
  }
}


/// Exception for get data from local
class PersistentException extends AppException {
  PersistentException({
    String? message,
    Object? data,
    StackTrace? stackTrace,
  }) : super(message, data, stackTrace);
}

/// Exception for get data from local
class CacheException extends PersistentException {
  CacheException({
    super.message,
    super.data,
    super.stackTrace,
  });
}

/// Exception for parse data
class ParseException extends AppException {
  ParseException({
    String? message,
    Object? data,
    StackTrace? stackTrace,
  }) : super(message, data, stackTrace);
}

class SeverException extends AppException {
  int? code;

  SeverException({
    this.code = HttpStatus.internalServerError,
    String? message,
    Object? data,
    StackTrace? stackTrace,
  }) : super(message, data, stackTrace);
}




