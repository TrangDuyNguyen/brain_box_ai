// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../profile_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileUserModel _$ProfileUserModelFromJson(Map<String, dynamic> json) {
  return _ProfileUserModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileUserModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get avatarUrl => throw _privateConstructorUsedError;
  set avatarUrl(String value) => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  set fullName(String value) => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  set email(String value) => throw _privateConstructorUsedError;
  DateTime get birthdate => throw _privateConstructorUsedError;
  set birthdate(DateTime value) => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  set phoneNumber(String value) => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  set gender(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileUserModelCopyWith<ProfileUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileUserModelCopyWith<$Res> {
  factory $ProfileUserModelCopyWith(
          ProfileUserModel value, $Res Function(ProfileUserModel) then) =
      _$ProfileUserModelCopyWithImpl<$Res, ProfileUserModel>;
  @useResult
  $Res call(
      {String id,
      String avatarUrl,
      String fullName,
      String email,
      DateTime birthdate,
      String phoneNumber,
      String gender});
}

/// @nodoc
class _$ProfileUserModelCopyWithImpl<$Res, $Val extends ProfileUserModel>
    implements $ProfileUserModelCopyWith<$Res> {
  _$ProfileUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatarUrl = null,
    Object? fullName = null,
    Object? email = null,
    Object? birthdate = null,
    Object? phoneNumber = null,
    Object? gender = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileUserModelImplCopyWith<$Res>
    implements $ProfileUserModelCopyWith<$Res> {
  factory _$$ProfileUserModelImplCopyWith(_$ProfileUserModelImpl value,
          $Res Function(_$ProfileUserModelImpl) then) =
      __$$ProfileUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String avatarUrl,
      String fullName,
      String email,
      DateTime birthdate,
      String phoneNumber,
      String gender});
}

/// @nodoc
class __$$ProfileUserModelImplCopyWithImpl<$Res>
    extends _$ProfileUserModelCopyWithImpl<$Res, _$ProfileUserModelImpl>
    implements _$$ProfileUserModelImplCopyWith<$Res> {
  __$$ProfileUserModelImplCopyWithImpl(_$ProfileUserModelImpl _value,
      $Res Function(_$ProfileUserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatarUrl = null,
    Object? fullName = null,
    Object? email = null,
    Object? birthdate = null,
    Object? phoneNumber = null,
    Object? gender = null,
  }) {
    return _then(_$ProfileUserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileUserModelImpl implements _ProfileUserModel {
  _$ProfileUserModelImpl(
      {required this.id,
      required this.avatarUrl,
      required this.fullName,
      required this.email,
      required this.birthdate,
      required this.phoneNumber,
      required this.gender});

  factory _$ProfileUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileUserModelImplFromJson(json);

  @override
  String id;
  @override
  String avatarUrl;
  @override
  String fullName;
  @override
  String email;
  @override
  DateTime birthdate;
  @override
  String phoneNumber;
  @override
  String gender;

  @override
  String toString() {
    return 'ProfileUserModel(id: $id, avatarUrl: $avatarUrl, fullName: $fullName, email: $email, birthdate: $birthdate, phoneNumber: $phoneNumber, gender: $gender)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileUserModelImplCopyWith<_$ProfileUserModelImpl> get copyWith =>
      __$$ProfileUserModelImplCopyWithImpl<_$ProfileUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileUserModelImplToJson(
      this,
    );
  }
}

abstract class _ProfileUserModel implements ProfileUserModel {
  factory _ProfileUserModel(
      {required String id,
      required String avatarUrl,
      required String fullName,
      required String email,
      required DateTime birthdate,
      required String phoneNumber,
      required String gender}) = _$ProfileUserModelImpl;

  factory _ProfileUserModel.fromJson(Map<String, dynamic> json) =
      _$ProfileUserModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get avatarUrl;
  set avatarUrl(String value);
  @override
  String get fullName;
  set fullName(String value);
  @override
  String get email;
  set email(String value);
  @override
  DateTime get birthdate;
  set birthdate(DateTime value);
  @override
  String get phoneNumber;
  set phoneNumber(String value);
  @override
  String get gender;
  set gender(String value);
  @override
  @JsonKey(ignore: true)
  _$$ProfileUserModelImplCopyWith<_$ProfileUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
