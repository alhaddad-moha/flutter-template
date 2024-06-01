import 'package:flutter/widgets.dart';

/// This class is used as a singleton to use a global context for navigation purposes
class NavigationService {
  late GlobalKey<NavigatorState> navigationKey;
  static NavigationService? _instance;
  NavigationService._() {
    navigationKey = GlobalKey<NavigatorState>();
    // navigatorKeyMaterialApp = GlobalKey<NavigatorState>();
  }
  static NavigationService get instance {
    _instance ??= NavigationService._();
    return _instance!;
  }

  BuildContext get navigationContext => navigationKey.currentContext!;

  BuildContext? _currentContext;

  BuildContext get currentContext => _currentContext ?? navigationContext;

  updateCurrentContext(BuildContext context) {
    _currentContext = context;
  }
}
