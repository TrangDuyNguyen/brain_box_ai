import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String id;
  final String avatarUrl;
  final String fullName;
  final String email;
  final DateTime birthdate;
  final String phoneNumber;
  final String gender;

  const ProfileEntity(
      {required this.id,
      required this.avatarUrl,
      required this.fullName,
      required this.email,
      required this.birthdate,
      required this.phoneNumber,
      required this.gender});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, avatarUrl, email, fullName, birthdate, phoneNumber, gender];
}
