import 'package:brain_box_ai/data/datasources/profile_setting_datasource.dart';
import 'package:brain_box_ai/data/repositories/profile_setting_repository_impl.dart';
import 'package:brain_box_ai/domain/repositories/profile_setting_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileSettingDataSourceProvider =
    Provider<ProfileSettingDataSource>((ref) {
  return ProfileSettingDataSourceImpl();
});

final profileSettingRepositoryProvider =
    Provider<ProfileSettingRepository>((ref) {
  return ProfileSettingRepositoryImpl(
      ref.read(profileSettingDataSourceProvider));
});