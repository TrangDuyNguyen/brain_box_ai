// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../prompt_search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromptSearchResultModellImpl _$$PromptSearchResultModellImplFromJson(
        Map<String, dynamic> json) =>
    _$PromptSearchResultModellImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      category: json['category'] as String,
      rate: (json['rate'] as num).toInt(),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$PromptSearchResultModellImplToJson(
        _$PromptSearchResultModellImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'category': instance.category,
      'rate': instance.rate,
      'createdAt': instance.createdAt,
    };
