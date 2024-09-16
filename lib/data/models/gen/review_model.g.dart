// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewModelImpl _$$ReviewModelImplFromJson(Map<String, dynamic> json) =>
    _$ReviewModelImpl(
      userId: json['userId'] as String,
      promptId: json['promptId'] as String,
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String,
      likeCount: (json['likeCount'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$ReviewModelImplToJson(_$ReviewModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'promptId': instance.promptId,
      'rating': instance.rating,
      'comment': instance.comment,
      'likeCount': instance.likeCount,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
