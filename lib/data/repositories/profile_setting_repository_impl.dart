import "package:brain_box_ai/core/exception/result.dart";
import "package:brain_box_ai/data/datasources/profile_setting_datasource.dart";
import "package:brain_box_ai/data/models/extentions/profile_mapper.dart";
import "package:brain_box_ai/domain/entities/profile/profile_entity.dart";
import "package:brain_box_ai/domain/repositories/profile_setting_repository.dart";

class ProfileSettingRepositoryImpl implements ProfileSettingRepository {
  final ProfileSettingDataSource dataSource;

  ProfileSettingRepositoryImpl(this.dataSource);

  @override
  Future<Result<ProfileEntity>> getProfile() async {
    try {
      final result = await dataSource.getProfile();

      if (result.isSuccess) {
        final profileModel = result.data;
        final profileEntity = ProfileMapper().fromDTO(profileModel!);
        return Result.success(profileEntity);
      } else {
        return Result.errors(result.getError()!);
      }
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result<ProfileEntity>> updateProfile() {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
  // TODO: implement your ProfileSettingRepositoryImpl
}
