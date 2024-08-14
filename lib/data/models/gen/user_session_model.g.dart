// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_session_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserSessionModelAdapter extends TypeAdapter<UserSessionModel> {
  @override
  final int typeId = 2;

  @override
  UserSessionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserSessionModel(
      guestToken: fields[0] as String?,
      accountToken: fields[1] as String?,
      refreshToken: fields[2] as String?,
      deviceToken: fields[3] as String?,
      userId: fields[4] as String?,
      userAgent: fields[5] as String?,
      ipAddress: fields[6] as String?,
      providerToken: fields[7] as String?,
      providerType: fields[8] as String?,
      displayName: fields[9] as String?,
      email: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserSessionModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.guestToken)
      ..writeByte(1)
      ..write(obj.accountToken)
      ..writeByte(2)
      ..write(obj.refreshToken)
      ..writeByte(3)
      ..write(obj.deviceToken)
      ..writeByte(4)
      ..write(obj.userId)
      ..writeByte(5)
      ..write(obj.userAgent)
      ..writeByte(6)
      ..write(obj.ipAddress)
      ..writeByte(7)
      ..write(obj.providerToken)
      ..writeByte(8)
      ..write(obj.providerType)
      ..writeByte(9)
      ..write(obj.displayName)
      ..writeByte(10)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserSessionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSessionModel _$UserSessionModelFromJson(Map<String, dynamic> json) =>
    UserSessionModel(
      guestToken: json['guestToken'] as String?,
      accountToken: json['accountToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      deviceToken: json['deviceToken'] as String?,
      userId: json['userId'] as String?,
      userAgent: json['userAgent'] as String?,
      ipAddress: json['ipAddress'] as String?,
      providerToken: json['providerToken'] as String?,
      providerType: json['providerType'] as String?,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserSessionModelToJson(UserSessionModel instance) =>
    <String, dynamic>{
      'guestToken': instance.guestToken,
      'accountToken': instance.accountToken,
      'refreshToken': instance.refreshToken,
      'deviceToken': instance.deviceToken,
      'userId': instance.userId,
      'userAgent': instance.userAgent,
      'ipAddress': instance.ipAddress,
      'providerToken': instance.providerToken,
      'providerType': instance.providerType,
      'displayName': instance.displayName,
      'email': instance.email,
    };
