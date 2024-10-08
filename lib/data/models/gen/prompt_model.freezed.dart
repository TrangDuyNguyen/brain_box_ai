// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../prompt_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PromptModel _$PromptModelFromJson(Map<String, dynamic> json) {
  return _PromptModel.fromJson(json);
}

/// @nodoc
mixin _$PromptModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  set content(String value) => throw _privateConstructorUsedError;
  CategoryModel get category => throw _privateConstructorUsedError;
  set category(CategoryModel value) => throw _privateConstructorUsedError;
  int get rate => throw _privateConstructorUsedError;
  set rate(int value) => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  set createdAt(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromptModelCopyWith<PromptModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromptModelCopyWith<$Res> {
  factory $PromptModelCopyWith(
          PromptModel value, $Res Function(PromptModel) then) =
      _$PromptModelCopyWithImpl<$Res, PromptModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      CategoryModel category,
      int rate,
      String createdAt});

  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class _$PromptModelCopyWithImpl<$Res, $Val extends PromptModel>
    implements $PromptModelCopyWith<$Res> {
  _$PromptModelCopyWithImpl(this._value, this._then);

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
              as CategoryModel,
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

  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res> get category {
    return $CategoryModelCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PromptModelImplCopyWith<$Res>
    implements $PromptModelCopyWith<$Res> {
  factory _$$PromptModelImplCopyWith(
          _$PromptModelImpl value, $Res Function(_$PromptModelImpl) then) =
      __$$PromptModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      CategoryModel category,
      int rate,
      String createdAt});

  @override
  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class __$$PromptModelImplCopyWithImpl<$Res>
    extends _$PromptModelCopyWithImpl<$Res, _$PromptModelImpl>
    implements _$$PromptModelImplCopyWith<$Res> {
  __$$PromptModelImplCopyWithImpl(
      _$PromptModelImpl _value, $Res Function(_$PromptModelImpl) _then)
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
    return _then(_$PromptModelImpl(
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
              as CategoryModel,
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
class _$PromptModelImpl implements _PromptModel {
  _$PromptModelImpl(
      {required this.id,
      required this.title,
      required this.content,
      required this.category,
      required this.rate,
      required this.createdAt});

  factory _$PromptModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromptModelImplFromJson(json);

  @override
  String id;
  @override
  String title;
  @override
  String content;
  @override
  CategoryModel category;
  @override
  int rate;
  @override
  String createdAt;

  @override
  String toString() {
    return 'PromptModel(id: $id, title: $title, content: $content, category: $category, rate: $rate, createdAt: $createdAt)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PromptModelImplCopyWith<_$PromptModelImpl> get copyWith =>
      __$$PromptModelImplCopyWithImpl<_$PromptModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromptModelImplToJson(
      this,
    );
  }
}

abstract class _PromptModel implements PromptModel {
  factory _PromptModel(
      {required String id,
      required String title,
      required String content,
      required CategoryModel category,
      required int rate,
      required String createdAt}) = _$PromptModelImpl;

  factory _PromptModel.fromJson(Map<String, dynamic> json) =
      _$PromptModelImpl.fromJson;

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
  CategoryModel get category;
  set category(CategoryModel value);
  @override
  int get rate;
  set rate(int value);
  @override
  String get createdAt;
  set createdAt(String value);
  @override
  @JsonKey(ignore: true)
  _$$PromptModelImplCopyWith<_$PromptModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
