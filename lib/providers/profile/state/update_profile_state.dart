import 'package:brain_box_ai/domain/entities/profile/profile_entity.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileSuccess extends ProfileState {
  final ProfileEntity profileEntity;
  const ProfileSuccess(this.profileEntity);
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);
}
