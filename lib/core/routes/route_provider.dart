import 'dart:async';
import 'package:template/core/providers/auth_provider.dart';
import 'package:template/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'navigator_service.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);
  return GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: router,
    redirect: router._redirectLogic,
    routes: router._routes,
    navigatorKey: NavigationService.instance.navigationKey,
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen(authProvider, (previous, next) {
      notifyListeners();
    });
  }

  FutureOr<String>? _redirectLogic(BuildContext context, GoRouterState state) {
    // final provider = _ref.read(authProvider);
    // final areWeLoggingIn = state.uri.toString() == LoginView.fullRoute;
    //
    // if (provider.isAuthenticated) {
    //   return areWeLoggingIn ? "/" : null;
    // }

    NavigationService.instance.updateCurrentContext(context);


    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: "/",
          name: "main-app",
          builder: (context, state) {
            return MaterialApp();
            /// todo return the main app view
            // return const MainAppView();
          },
        ),

      ];
}
