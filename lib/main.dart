import 'package:template/common/constants/app_constants.dart';
import 'package:template/core/helpers/camera.dart';
import 'package:template/core/providers/app_provider.dart';
import 'package:template/core/providers/localization_provider.dart';
import 'package:template/core/routes/route_provider.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/service_locator.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.databaseName);
  setupServiceLocator();
  CameraHelper.cameras = await availableCameras();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  // SystemChrome.setPreferredOrientations([
  //   // DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarIconBrightness: Brightness.dark, // For Android
    statusBarBrightness: Brightness.dark, // For iOS
  ));
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    bool isTablet = MediaQuery.of(context).size.width > 600;

    return Consumer(
      builder: (context, ref, child){

        ref.watch(appProvider);
        final router = ref.watch(routerProvider);

        ref.watch(localizationProvider);

        return ScreenUtilInit(
          designSize: isTablet ? const Size(1194, 834) : const Size(375, 812),
          builder: (_, __){

            return MaterialApp.router(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  useMaterial3: true,
                  scaffoldBackgroundColor: AppColors.appBackGroundColor,
                  fontFamily: "BalooBhaijaan2"
              ),
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
              routeInformationProvider: router.routeInformationProvider,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: locator<LocalizationProvider>().currentLocale,
              supportedLocales: AppLocalizations.supportedLocales,
              builder: (context, _) {

                LocalizationProvider.initBuild(context);
                var child = _!;



                return child;
              },
            );
          },
        );
      },
    );


    //   ScreenUtilInit(
    //   designSize: const Size(375, 812),
    //   builder: (_, __){
    //     return
    //   },
    // );
  }
}

