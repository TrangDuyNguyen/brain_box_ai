import '../../../models/setting_model.dart';
import '../core/hive_operation.dart';

class SystemSettingOperator extends HiveDatabaseOperation<SettingModel> {
  SystemSettingOperator({required super.primitiveDatabase});
}
