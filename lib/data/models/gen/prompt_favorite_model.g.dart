// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../prompt_favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromptFavoriteModelImpl _$$PromptFavoriteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PromptFavoriteModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      category: json['category'] as String,
      rate: (json['rate'] as num).toInt(),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$PromptFavoriteModelImplToJson(
        _$PromptFavoriteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'category': instance.category,
      'rate': instance.rate,
      'createdAt': instance.createdAt,
    };
