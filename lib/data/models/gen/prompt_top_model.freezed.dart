// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../prompt_top_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PromptTopModel _$PromptTopModelFromJson(Map<String, dynamic> json) {
  return _PromptTopModel.fromJson(json);
}

/// @nodoc
mixin _$PromptTopModel {
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
  $PromptTopModelCopyWith<PromptTopModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromptTopModelCopyWith<$Res> {
  factory $PromptTopModelCopyWith(
          PromptTopModel value, $Res Function(PromptTopModel) then) =
      _$PromptTopModelCopyWithImpl<$Res, PromptTopModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String category,
      String createdAt});
}

/// @nodoc
class _$PromptTopModelCopyWithImpl<$Res, $Val extends PromptTopModel>
    implements $PromptTopModelCopyWith<$Res> {
  _$PromptTopModelCopyWithImpl(this._value, this._then);

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
abstract class _$$PromptTopModelImplCopyWith<$Res>
    implements $PromptTopModelCopyWith<$Res> {
  factory _$$PromptTopModelImplCopyWith(_$PromptTopModelImpl value,
          $Res Function(_$PromptTopModelImpl) then) =
      __$$PromptTopModelImplCopyWithImpl<$Res>;
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
class __$$PromptTopModelImplCopyWithImpl<$Res>
    extends _$PromptTopModelCopyWithImpl<$Res, _$PromptTopModelImpl>
    implements _$$PromptTopModelImplCopyWith<$Res> {
  __$$PromptTopModelImplCopyWithImpl(
      _$PromptTopModelImpl _value, $Res Function(_$PromptTopModelImpl) _then)
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
    return _then(_$PromptTopModelImpl(
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
class _$PromptTopModelImpl implements _PromptTopModel {
  _$PromptTopModelImpl(
      {required this.id,
      required this.title,
      required this.content,
      required this.category,
      required this.createdAt});

  factory _$PromptTopModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromptTopModelImplFromJson(json);

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
    return 'PromptTopModel(id: $id, title: $title, content: $content, category: $category, createdAt: $createdAt)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PromptTopModelImplCopyWith<_$PromptTopModelImpl> get copyWith =>
      __$$PromptTopModelImplCopyWithImpl<_$PromptTopModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromptTopModelImplToJson(
      this,
    );
  }
}

abstract class _PromptTopModel implements PromptTopModel {
  factory _PromptTopModel(
      {required String id,
      required String title,
      required String content,
      required String category,
      required String createdAt}) = _$PromptTopModelImpl;

  factory _PromptTopModel.fromJson(Map<String, dynamic> json) =
      _$PromptTopModelImpl.fromJson;

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
  _$$PromptTopModelImplCopyWith<_$PromptTopModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
