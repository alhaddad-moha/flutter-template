import 'package:template/common/constants/app_constants.dart';
import 'package:template/common/models/language_model.dart';
import 'package:template/core/providers/app_provider.dart';
import 'package:template/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


final localizationProvider =
ChangeNotifierProvider<LocalizationProvider>((ref) {
  return locator<LocalizationProvider>();
});

late AppLocalizations loc;


extension LocalizedBuildContext on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
}

/// This class is used to manage the localization of the app.
class LocalizationProvider with ChangeNotifier {


  LocalizationProvider(){

    init();
  }


  static initBuild(BuildContext context) {
    loc = AppLocalizations.of(context);
  }


  Future init() async {

  }

  static Locale localeAr = const Locale('ar');
  static Locale localeEn = const Locale('en');

  static LanguageModel defaultLanguageModel = AppConstants.listLanguage[0];



  LanguageModel get currentLanguageModel {
    return locator<AppProvider>().language ?? defaultLanguageModel;
  }

  Locale get currentLocale => Locale(currentLanguageModel.code);

  String get currentLanguageCode => currentLanguageModel.code;

  bool get currentLanguageIsArabic {
    return currentLanguageModel.code == 'ar';
  }

  bool get currentLanguageIsEnglish {
    return currentLanguageModel.code == 'en';
  }

  LanguageModel getLanguageModelByCode(String languageCode) {
    return AppConstants.listLanguage.firstWhere((element) => element.code == languageCode);
  }

  Future changeLanguage({required BuildContext context, required Locale locale}) async {
    LanguageModel _languageModel = getLanguageModelByCode(locale.languageCode);

    locator<AppProvider>().appSettings.language = _languageModel;
    locator<AppProvider>().refreshDb();
    notifyListeners();
  }


}
