import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _navigationService =
      NavigationService._internal();
  factory NavigationService() => _navigationService;

  NavigationService._internal();

  //navigation key
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();
  static get navigationKey => _navigatorKey;

  // navigation push named
  static Future<dynamic> pushNamed({required String routeName, Object? args}) {
    return _navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  static navigate(context, route) {
    context.go(route);
  }

  static BuildContext get context => _navigatorKey.currentState!.context;
}
