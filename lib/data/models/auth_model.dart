import 'package:brain_box_ai/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({required super.id, required super.email});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
    };
  }

  AuthEntity toEntity() {
    return AuthEntity(
      id: id,
      email: email,
    );
  }

  factory AuthModel.fromEntity(AuthEntity entity) {
    return AuthModel(
      id: entity.id,
      email: entity.email,
    );
  }
}
