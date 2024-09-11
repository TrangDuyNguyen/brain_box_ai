// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../prompt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromptModelImpl _$$PromptModelImplFromJson(Map<String, dynamic> json) =>
    _$PromptModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      category:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      rate: (json['rate'] as num).toInt(),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$PromptModelImplToJson(_$PromptModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'category': instance.category.toJson(),
      'rate': instance.rate,
      'createdAt': instance.createdAt,
    };
