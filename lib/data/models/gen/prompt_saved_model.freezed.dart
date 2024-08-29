// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../prompt_saved_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PromptSavedModel _$PromptSavedModelFromJson(Map<String, dynamic> json) {
  return _PromptSavedModel.fromJson(json);
}

/// @nodoc
mixin _$PromptSavedModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  set content(String value) => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  set category(String value) => throw _privateConstructorUsedError;
  int get rate => throw _privateConstructorUsedError;
  set rate(int value) => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  set createdAt(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromptSavedModelCopyWith<PromptSavedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromptSavedModelCopyWith<$Res> {
  factory $PromptSavedModelCopyWith(
          PromptSavedModel value, $Res Function(PromptSavedModel) then) =
      _$PromptSavedModelCopyWithImpl<$Res, PromptSavedModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String category,
      int rate,
      String createdAt});
}

/// @nodoc
class _$PromptSavedModelCopyWithImpl<$Res, $Val extends PromptSavedModel>
    implements $PromptSavedModelCopyWith<$Res> {
  _$PromptSavedModelCopyWithImpl(this._value, this._then);

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
    Object? rate = null,
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
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromptSavedModelImplCopyWith<$Res>
    implements $PromptSavedModelCopyWith<$Res> {
  factory _$$PromptSavedModelImplCopyWith(_$PromptSavedModelImpl value,
          $Res Function(_$PromptSavedModelImpl) then) =
      __$$PromptSavedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String category,
      int rate,
      String createdAt});
}

/// @nodoc
class __$$PromptSavedModelImplCopyWithImpl<$Res>
    extends _$PromptSavedModelCopyWithImpl<$Res, _$PromptSavedModelImpl>
    implements _$$PromptSavedModelImplCopyWith<$Res> {
  __$$PromptSavedModelImplCopyWithImpl(_$PromptSavedModelImpl _value,
      $Res Function(_$PromptSavedModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? category = null,
    Object? rate = null,
    Object? createdAt = null,
  }) {
    return _then(_$PromptSavedModelImpl(
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
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromptSavedModelImpl implements _PromptSavedModel {
  _$PromptSavedModelImpl(
      {required this.id,
      required this.title,
      required this.content,
      required this.category,
      required this.rate,
      required this.createdAt});

  factory _$PromptSavedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromptSavedModelImplFromJson(json);

  @override
  String id;
  @override
  String title;
  @override
  String content;
  @override
  String category;
  @override
  int rate;
  @override
  String createdAt;

  @override
  String toString() {
    return 'PromptSavedModel(id: $id, title: $title, content: $content, category: $category, rate: $rate, createdAt: $createdAt)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PromptSavedModelImplCopyWith<_$PromptSavedModelImpl> get copyWith =>
      __$$PromptSavedModelImplCopyWithImpl<_$PromptSavedModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromptSavedModelImplToJson(
      this,
    );
  }
}

abstract class _PromptSavedModel implements PromptSavedModel {
  factory _PromptSavedModel(
      {required String id,
      required String title,
      required String content,
      required String category,
      required int rate,
      required String createdAt}) = _$PromptSavedModelImpl;

  factory _PromptSavedModel.fromJson(Map<String, dynamic> json) =
      _$PromptSavedModelImpl.fromJson;

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
  int get rate;
  set rate(int value);
  @override
  String get createdAt;
  set createdAt(String value);
  @override
  @JsonKey(ignore: true)
  _$$PromptSavedModelImplCopyWith<_$PromptSavedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
