import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'base_entity.dart';

class UserSession extends BaseEntity {
  String? guestToken;
  String? providerToken;
  String? accountToken;
  String? deviceToken;
  String? refreshToken;
  String? email;
  String? userId;
  String? displayName;
  String? userAgent;
  String? ipAddress;
  String? codeResetPassword;

  UserSession({
    this.guestToken,
    this.accountToken,
    this.providerToken,
    this.refreshToken,
    this.deviceToken,
    this.userId,
    this.userAgent,
    this.ipAddress,
    this.displayName,
    this.email,
    this.codeResetPassword,
  });

  bool get hasToken => guestToken != null || accountToken != null;

  String? get targetAccessToken {
    return accountToken ?? providerToken ?? guestToken;
  }

  bool get isNeedReLogin {
    return deviceToken != null;
  }

  bool get isGuest {
    return accountToken == null && providerToken == null && guestToken != null;
  }

  bool get isBasedAccount {
    return accountToken != null;
  }

  bool get isBasedProvider {
    return providerToken != null;
  }

  bool get isBasedAccountOrProvider => isBasedAccount || isBasedProvider;

  void setDeviceToken(String token) {
    deviceToken = token;
  }

  void switchToGuest() {
    accountToken = null;
    providerToken = null;
    userId = null;
    userAgent = null;
    displayName = null;
    email = null;
  }

  void switchToAccount() {
    guestToken = null;
    providerToken = null;
  }

  void switchToProvider() {
    guestToken = null;
    accountToken = null;
  }

  void switchToEmpty() {
    guestToken = null;
    accountToken = null;
    providerToken = null;
    refreshToken = null;
    deviceToken = null;
    userId = null;
    userAgent = null;
    ipAddress = null;
    displayName = null;
    email = null;
  }

  factory UserSession.fromJson(Map<String, dynamic> json) {
    return UserSession(
      guestToken: json['guestToken'],
      accountToken: json['accountToken'],
      providerToken: json['providerToken'],
      refreshToken: json['refreshToken'],
      deviceToken: json['deviceToken'],
      userId: json['userId'],
      userAgent: json['userAgent'],
      ipAddress: json['ipAddress'],
      displayName: json['displayName'],
      email: json['email'],
      codeResetPassword: json['codeResetPassword'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'guestToken': guestToken,
      'accountToken': accountToken,
      'providerToken': providerToken,
      'refreshToken': refreshToken,
      'deviceToken': deviceToken,
      'userId': userId,
      'userAgent': userAgent,
      'ipAddress': ipAddress,
      'displayName': displayName,
      'email': email,
      'codeResetPassword': codeResetPassword
    };
  }

  @override
  List<Object?> get props => [
    guestToken,
    accountToken,
    providerToken,
    refreshToken,
    deviceToken,
    userId,
    userAgent,
    ipAddress,
    displayName,
    email,
    id,
    createdAt,
  ];
}