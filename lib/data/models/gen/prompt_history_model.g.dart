// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../prompt_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromptHistoryModelImpl _$$PromptHistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PromptHistoryModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      category: json['category'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$PromptHistoryModelImplToJson(
        _$PromptHistoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'category': instance.category,
      'createdAt': instance.createdAt,
    };
