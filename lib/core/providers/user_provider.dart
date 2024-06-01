import 'dart:async';

import 'package:template/common/constants/app_constants.dart';
import 'package:template/common/models/user.dart';
import 'package:template/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final userProvider = ChangeNotifierProvider<UserProvider>((ref){
  return locator<UserProvider>();
});

class UserProvider extends ChangeNotifier{

  late UserModel _userModel;
  late Box _databaseBox;
  UserProvider(){

    _userModel = UserModel.empty();
    _databaseBox = Hive.box(AppConstants.databaseName);
  }

  final StreamController<UserModel> streamController =
  StreamController<UserModel>.broadcast();


  Future init()async{
    await getData();
  }

  Future getData()async{
    final userFromLocal = await _databaseBox.get(UserModelFields.userBox);

    if(userFromLocal == null){
      _refreshDb();
    }else{
      _userModel = UserModel.fromMap(Map<String, dynamic>.from(userFromLocal));
      notifyListeners();
    }
  }


  Future _refreshDb()async{
    notifyListeners();
    streamController.add(_userModel);
    await _databaseBox.put(UserModelFields.userBox, _userModel.toMap());
  }


  Future setUser(UserModel user) async {
    _userModel = user;
    await _refreshDb();
  }

  Future setUserName(String userFirstName, String userLastName) async {
    _userModel.name = "$userFirstName $userLastName";
    await _refreshDb();
  }

  bool get isSpecialist => _userModel.isSpecialist;

  UserModel? get userModel{
    if(_userModel.id == 0) return null;
    return _userModel;
  }

  Future logout() async {
    _userModel = UserModel.empty();

    await _refreshDb();
  }

}