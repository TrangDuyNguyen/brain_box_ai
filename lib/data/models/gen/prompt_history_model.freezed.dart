// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../prompt_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PromptHistoryModel _$PromptHistoryModelFromJson(Map<String, dynamic> json) {
  return _PromptHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$PromptHistoryModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  set content(String value) => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  set category(String value) => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  set createdAt(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromptHistoryModelCopyWith<PromptHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromptHistoryModelCopyWith<$Res> {
  factory $PromptHistoryModelCopyWith(
          PromptHistoryModel value, $Res Function(PromptHistoryModel) then) =
      _$PromptHistoryModelCopyWithImpl<$Res, PromptHistoryModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String category,
      String createdAt});
}

/// @nodoc
class _$PromptHistoryModelCopyWithImpl<$Res, $Val extends PromptHistoryModel>
    implements $PromptHistoryModelCopyWith<$Res> {
  _$PromptHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? category = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromptHistoryModelImplCopyWith<$Res>
    implements $PromptHistoryModelCopyWith<$Res> {
  factory _$$PromptHistoryModelImplCopyWith(_$PromptHistoryModelImpl value,
          $Res Function(_$PromptHistoryModelImpl) then) =
      __$$PromptHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String category,
      String createdAt});
}

/// @nodoc
class __$$PromptHistoryModelImplCopyWithImpl<$Res>
    extends _$PromptHistoryModelCopyWithImpl<$Res, _$PromptHistoryModelImpl>
    implements _$$PromptHistoryModelImplCopyWith<$Res> {
  __$$PromptHistoryModelImplCopyWithImpl(_$PromptHistoryModelImpl _value,
      $Res Function(_$PromptHistoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? category = null,
    Object? createdAt = null,
  }) {
    return _then(_$PromptHistoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromptHistoryModelImpl implements _PromptHistoryModel {
  _$PromptHistoryModelImpl(
      {required this.id,
      required this.title,
      required this.content,
      required this.category,
      required this.createdAt});

  factory _$PromptHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromptHistoryModelImplFromJson(json);

  @override
  String id;
  @override
  String title;
  @override
  String content;
  @override
  String category;
  @override
  String createdAt;

  @override
  String toString() {
    return 'PromptHistoryModel(id: $id, title: $title, content: $content, category: $category, createdAt: $createdAt)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PromptHistoryModelImplCopyWith<_$PromptHistoryModelImpl> get copyWith =>
      __$$PromptHistoryModelImplCopyWithImpl<_$PromptHistoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromptHistoryModelImplToJson(
      this,
    );
  }
}

abstract class _PromptHistoryModel implements PromptHistoryModel {
  factory _PromptHistoryModel(
      {required String id,
      required String title,
      required String content,
      required String category,
      required String createdAt}) = _$PromptHistoryModelImpl;

  factory _PromptHistoryModel.fromJson(Map<String, dynamic> json) =
      _$PromptHistoryModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get title;
  set title(String value);
  @override
  String get content;
  set content(String value);
  @override
  String get category;
  set category(String value);
  @override
  String get createdAt;
  set createdAt(String value);
  @override
  @JsonKey(ignore: true)
  _$$PromptHistoryModelImplCopyWith<_$PromptHistoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
