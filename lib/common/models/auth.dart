import 'dart:convert';

class AuthModel {
  bool isAuthenticated;
  String? accessToken;
  String? refreshToken;
  AuthModel({
    this.isAuthenticated = false,
    this.accessToken,
    this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'isAuthenticated': isAuthenticated,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      isAuthenticated: map['isAuthenticated'],
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source));

  factory AuthModel.empty() => AuthModel(
    isAuthenticated: false,
  );
}

abstract class AuthModelFields {
  static const authBoxName = "auth";
  static const String isAuthenticated = 'isAuthenticated';
  static const String accessToken = 'token';
  static const String refreshToken = 'refreshToken';
}
