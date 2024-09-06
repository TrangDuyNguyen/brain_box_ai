// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchResultModelImpl _$$SearchResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchResultModelImpl(
      id: (json['id'] as num).toInt(),
      result: json['result'] as String,
    );

Map<String, dynamic> _$$SearchResultModelImplToJson(
        _$SearchResultModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'result': instance.result,
    };
