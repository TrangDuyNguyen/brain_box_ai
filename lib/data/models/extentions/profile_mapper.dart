import 'package:brain_box_ai/data/models/extentions/user_session_mapper.dart';
import 'package:brain_box_ai/data/models/profile_user_model.dart';
import 'package:brain_box_ai/domain/entities/profile/profile_entity.dart';

class ProfileMapper extends MapperModel<ProfileUserModel, ProfileEntity> {
  @override
  ProfileEntity fromDTO(ProfileUserModel dto) {
    return ProfileEntity(
        id: dto.id,
        avatarUrl: dto.avatarUrl,
        fullName: dto.fullName,
        email: dto.email,
        birthdate: dto.birthdate,
        phoneNumber: dto.phoneNumber,
        gender: dto.gender);
  }

  @override
  ProfileUserModel toDTO(ProfileEntity model) {
    return ProfileUserModel(
      id: model.id,
      avatarUrl: model.avatarUrl,
      fullName: model.fullName,
      email: model.email,
      birthdate: model.birthdate,
      phoneNumber: model.phoneNumber,
      gender: model.gender,
    );
  }
}
