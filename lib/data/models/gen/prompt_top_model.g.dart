// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../prompt_top_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromptTopModelImpl _$$PromptTopModelImplFromJson(Map<String, dynamic> json) =>
    _$PromptTopModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      category: json['category'] as String,
      rate: (json['rate'] as num).toInt(),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$PromptTopModelImplToJson(
        _$PromptTopModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'category': instance.category,
      'rate': instance.rate,
      'createdAt': instance.createdAt,
    };
