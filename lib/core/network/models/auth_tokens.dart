import 'dart:convert';

import 'package:template/core/providers/localization_provider.dart';
import 'package:template/service_locator.dart';
import 'package:equatable/equatable.dart';

class AuthTokensModel with EquatableMixin {
  final String accessToken;
  final String refreshToken;

  const AuthTokensModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthTokensModel.fromMap(Map<String, dynamic> map) => AuthTokensModel(
    accessToken: map[AuthTokensModelFields.accessToken],
    refreshToken: map[AuthTokensModelFields.refreshToken],
  );

  Map<String, dynamic> toMap() => {
    AuthTokensModelFields.accessToken: accessToken,
    AuthTokensModelFields.refreshToken: refreshToken,
  };

  factory AuthTokensModel.fromJson(String data) {
    return AuthTokensModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  AuthTokensModel copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return AuthTokensModel(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  @override
  List<Object?> get props => [ accessToken, refreshToken];

  static empty() {
    return const AuthTokensModel(accessToken: '', refreshToken: '',);
  }
}

abstract class AuthTokensModelFields {
  static const id = 'id';
  static const accessToken = 'accessToken';
  static const refreshToken = 'refreshToken';
}
