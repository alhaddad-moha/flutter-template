import 'dart:async';

import 'package:template/common/constants/app_constants.dart';
import 'package:template/common/models/app_settings.dart';
import 'package:template/common/models/language_model.dart';
import 'package:template/core/providers/auth_provider.dart';
import 'package:template/core/providers/user_provider.dart';
import 'package:template/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final appProvider = ChangeNotifierProvider<AppProvider>((ref) => AppProvider());

class AppProvider extends ChangeNotifier{

  late AppSettings appSettings;
  late Box _databaseBox;
  AppProvider(){

    appSettings = AppSettings.defaultSettings();
    _databaseBox = Hive.box(AppConstants.databaseName);
    init();
  }

  void init()async{
    await getData();
    await locator<AuthProvider>().init();
    await locator<UserProvider>().init();
  }

  final StreamController<AppSettings> streamController =
  StreamController<AppSettings>.broadcast();

  LanguageModel get language => appSettings.language;

  Future getData()async{
    final appSettingsFromLocal = await _databaseBox.get(AppSettingsField.appSettingBoxName);

    if(appSettingsFromLocal == null){
      refreshDb();
    }else{
      appSettings = AppSettings.fromMap(appSettingsFromLocal);
      notifyListeners();
    }
  }

  void refreshDb(){
    notifyListeners();
    streamController.add(appSettings);
    _databaseBox.put(AppSettingsField.appSettingBoxName, appSettings.toMap());
  }
}