import 'package:intl/intl.dart';

class FormatDateUtils {
  /// Chuyển `DateTime` thành `String` theo định dạng được truyền vào
  /// [date] là `DateTime` cần định dạng
  /// [format] là chuỗi định dạng theo chuẩn `intl` như 'dd/MM/yyyy' hoặc 'yyyy-MM-dd'
  static String formatDate(DateTime date, {String format = 'dd/MM/yyyy'}) {
    return DateFormat(format).format(date);
  }

  /// Chuyển chuỗi `String` dạng ISO 8601 thành `DateTime`
  static DateTime parseIso8601(String dateString) {
    return DateTime.parse(dateString);
  }

  /// Chuyển chuỗi `String` dạng ISO 8601 thành `String` theo định dạng mới
  static String formatIso8601(String dateString,
      {String format = 'dd/MM/yyyy'}) {
    final DateTime dateTime = parseIso8601(dateString);
    return formatDate(dateTime, format: format);
  }
}
