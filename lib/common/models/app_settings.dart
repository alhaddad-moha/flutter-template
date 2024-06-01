import 'dart:convert';
import 'language_model.dart';

class AppSettings {

  LanguageModel language;
  bool isTablet;

  AppSettings({
    required this.language,
    this.isTablet = false,
  });

  factory AppSettings.defaultSettings() => AppSettings(
    language: LanguageModel.defaultLanguage(),
    isTablet: false
  );


  factory AppSettings.fromMap(Map<dynamic, dynamic> map) => AppSettings(
    language: LanguageModel.fromMap(map[AppSettingsField.language]),
    isTablet: map[AppSettingsField.isTablet]
  );


  factory AppSettings.fromJson(String data) => AppSettings.fromMap(json.decode(data));


  factory AppSettings.empty() => AppSettings(
    language: LanguageModel.empty(),
    isTablet: false,
  );

  Map<String, dynamic> toMap() => {
    AppSettingsField.language : language.toMap(),
    AppSettingsField.isTablet : isTablet,
  };
}

abstract class AppSettingsField{
  static const appSettingBoxName = "settings";
  static const language = "language";
  static const isTablet = "is_tablet";
}
