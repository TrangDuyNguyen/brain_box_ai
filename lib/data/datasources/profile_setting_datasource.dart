import 'package:brain_box_ai/data/datasources/dummy_data/dummy_profile_data.dart';
import 'package:brain_box_ai/data/models/profile_user_model.dart';

import '../../core/exception/result.dart';

abstract class ProfileSettingDataSource {
  // TODO: implement your ProfileSettingDataSource
  Future<Result<ProfileUserModel>> getProfile();
  Future<Result<ProfileUserModel>> updateProfile();
}

class ProfileSettingDataSourceImpl implements ProfileSettingDataSource {
  @override
  Future<Result<ProfileUserModel>> getProfile() async {
    try {
      final profile = ProfileUserModel.fromJson(jsonProfile);
      return Result.success(profile);
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result<ProfileUserModel>> updateProfile() {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
  // TODO: implement your ProfileSettingDataSourceImpl
}
