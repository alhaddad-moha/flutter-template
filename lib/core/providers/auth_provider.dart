import 'dart:async';

import 'package:template/common/constants/app_constants.dart';
import 'package:template/common/models/auth.dart';
import 'package:template/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';


final authProvider = ChangeNotifierProvider<AuthProvider>((ref){
  return locator<AuthProvider>();
});

class AuthProvider extends ChangeNotifier{

  late AuthModel _authModel;
  late Box _databaseBox;
  AuthProvider(){

    _authModel = AuthModel();
    _databaseBox = Hive.box(AppConstants.databaseName);
  }

  final StreamController<AuthModel> streamController =
  StreamController<AuthModel>.broadcast();


  Future init()async{
    await getData();
  }

  Future getData()async{
    final authFromLocal = await _databaseBox.get(AuthModelFields.authBoxName);

    if(authFromLocal == null){
      _refreshDb();
    }else{
      _authModel = AuthModel.fromMap(Map<String, dynamic>.from(authFromLocal));
      notifyListeners();
    }
  }

  String? get accessToken => _authModel.accessToken;
  set accessToken(String? value) {
    _authModel.accessToken = value;
    _refreshDb();
  }

  String? get refreshToken => _authModel.refreshToken;
  set refreshToken(String? value) {
    _authModel.refreshToken = value;
    _refreshDb();
  }


  Future _refreshDb()async{
    notifyListeners();
    streamController.add(_authModel);
    await _databaseBox.put(AuthModelFields.authBoxName, _authModel.toMap());
  }


  Map<String, dynamic> get accessTokenDecode => JwtDecoder.decode(accessToken!);



  bool get isAuthenticated => _authModel.isAuthenticated;
  bool get isNotAuthenticated => !isAuthenticated;
  Future changeAuthenticated(bool value) async {
    _authModel.isAuthenticated = value;
    await _refreshDb();
  }

  AuthModel get authModel => _authModel;

  Future logout() async {

    _authModel = AuthModel(
      isAuthenticated: false,
    );

    await _refreshDb();
  }

}