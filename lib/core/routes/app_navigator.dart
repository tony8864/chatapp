import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppPage {
  chats,
  contacts,
  explore,
  settings,
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppNavigator {
  static void go(String route) {
    navigatorKey.currentState!.context.go(route);
  }

  static void push(String route) {
    navigatorKey.currentState!.context.push(route);
  }
}
