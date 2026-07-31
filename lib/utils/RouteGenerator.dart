import 'package:express3/core/ui/screens/AddScreen.dart';
import 'package:express3/core/ui/screens/AddSenderScreen.dart';
import 'package:express3/core/ui/screens/AdminAuthScreen.dart';
import 'package:express3/core/ui/screens/DeleteOldDataScreen.dart';
import 'package:express3/core/ui/screens/LoginScreen.dart';
import 'package:express3/core/ui/screens/Main2Screen.dart';
import 'package:express3/core/ui/screens/MainScreen.dart';
import 'package:express3/core/ui/screens/PriceScreen.dart';
import 'package:express3/core/ui/screens/SplachScreen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    PageRouteBuilder<dynamic> func(widget) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      );
    }

    switch (settings.name) {
      case '/': {

        return func(SplachScreen());
      }
      case '/login': {

        return func(LoginScreen());
      }
      case '/add': {

        return func(AddScreen());
      }
      case '/price': {

        return func(PriceScreen());
      }
      case '/aa': {

        return func(AdminAuthScreen());
      }
      case '/as': {

        return func(AddSenderScreen());
      }
      case '/dod': {

        return func(DeleteOldDataScreen());
      }
      case '/main2': {

        return func(Main2Screen());
      }
      default: { ///main

        return func(MainScreen());
      }
    }
  }
}