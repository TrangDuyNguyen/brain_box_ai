// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../profile_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileUserModelImpl _$$ProfileUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileUserModelImpl(
      id: json['id'] as String,
      avatarUrl: json['avatarUrl'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      birthdate: DateTime.parse(json['birthdate'] as String),
      phoneNumber: json['phoneNumber'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$$ProfileUserModelImplToJson(
        _$ProfileUserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatarUrl': instance.avatarUrl,
      'fullName': instance.fullName,
      'email': instance.email,
      'birthdate': instance.birthdate.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'gender': instance.gender,
    };
