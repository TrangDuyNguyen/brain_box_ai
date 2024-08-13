// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../prompt_saved_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromptSavedModelImpl _$$PromptSavedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PromptSavedModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      category: json['category'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$PromptSavedModelImplToJson(
        _$PromptSavedModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'category': instance.category,
      'createdAt': instance.createdAt,
    };
