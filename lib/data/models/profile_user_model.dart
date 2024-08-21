import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/profile_user_model.freezed.dart';

part 'gen/profile_user_model.g.dart';

@unfreezed
class ProfileUserModel with _$ProfileUserModel {
  factory ProfileUserModel({
    required String id,
    required String avatarUrl,
    required String fullName,
    required String email,
    required DateTime birthdate,
    required String phoneNumber,
    required String gender,
  }) = _ProfileUserModel;

  factory ProfileUserModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileUserModelFromJson(json);
}
