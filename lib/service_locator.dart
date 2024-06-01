import 'package:template/core/providers/app_provider.dart';
import 'package:template/core/providers/auth_provider.dart';
import 'package:template/core/providers/localization_provider.dart';
import 'package:template/core/providers/user_provider.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServiceLocator(){

  locator.registerLazySingleton(() => AppProvider());
  locator.registerLazySingleton(() => AuthProvider());
  locator.registerLazySingleton(() => UserProvider());
  locator.registerLazySingleton(() => LocalizationProvider());

}