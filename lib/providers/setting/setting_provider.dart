import 'package:brain_box_ai/data/datasources/local/setting_local_datasource.dart';
import 'package:brain_box_ai/domain/usecases/setting_user_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repositories/setting_repository_impl.dart';
import '../../domain/repositories/setting_repository.dart';

// DataSource Provider
final settingDataSourceProvider = Provider<SettingLocalDataSource>((ref) {
  return SettingLocalDataSourceImp();
});

// Repository Provider
final settingRepositoryProvider =
    Provider<SettingsRepository>((ref) {
  final dataSource = ref.read(settingDataSourceProvider);
  return SettingRepositoryImp(dataSource);
});

// UseCase Provider
final settingUseCaseProvider = Provider<SettingUserCase>((ref) {
  final repository = ref.read(settingRepositoryProvider);
  return SettingUserCase(repository);
});
