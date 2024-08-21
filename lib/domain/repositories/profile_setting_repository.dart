import 'package:brain_box_ai/core/exception/result.dart';
import 'package:brain_box_ai/domain/entities/profile/profile_entity.dart';

abstract class ProfileSettingRepository {
  Future<Result<ProfileEntity>> getProfile();
  Future<Result<ProfileEntity>> updateProfile();
}
