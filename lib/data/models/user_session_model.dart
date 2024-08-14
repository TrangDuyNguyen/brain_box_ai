import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../db/hive/core/hive_model.dart';
import '../db/hive/core/hive_types.dart';

part 'gen/user_session_model.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypes.userSessionId)
class UserSessionModel extends HiveObject with HiveModelMixin {
  static String modelKey = 'user_session';

  @override
  String get key => modelKey;

  @HiveField(0)
  final String? guestToken;
  @HiveField(1)
  final String? accountToken;
  @HiveField(2)
  final String? refreshToken;
  @HiveField(3)
  final String? deviceToken;

  @HiveField(4)
  final String? userId;
  @HiveField(5)
  final String? userAgent;
  @HiveField(6)
  final String? ipAddress;
  @HiveField(7)
  final String? providerToken;
  @HiveField(8)
  final String? providerType;
  @HiveField(9)
  final String? displayName;
  @HiveField(10)
  final String? email;

  UserSessionModel({
    this.guestToken,
    this.accountToken,
    this.refreshToken,
    this.deviceToken,
    this.userId,
    this.userAgent,
    this.ipAddress,
    this.providerToken,
    this.providerType,
    this.displayName,
    this.email,
  });

  factory UserSessionModel.fromJson(Map<String, dynamic> json) =>
      _$UserSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserSessionModelToJson(this);
}