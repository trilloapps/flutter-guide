import 'package:flutter/material.dart';
import 'package:test_demo/screens/authentication/login.dart';

import '../screens/authentication/forget.dart';
import '../screens/navigation_bar_screens/home_screen.dart';
import '../screens/no_connection/no_connection.dart';
import '../screens/splash_screen/splash_screen.dart';


class RouterHelpers {
  static const initial = "/";
  static const noConnectionScreen = "/noConnectionScreen";
  static const String splashScreen = '/';
  static const String loginScreen = '/login_screen';
  static const String forgetScreen = '/forgetScreen';
  // static const String navBar = '/navBar';
  static const String homeScreen = '/homeScreen';

  ///Screen////

  static Map<String, Widget Function(BuildContext context)> routes = {
    // navBar: (context) => BottomNavigateBar(),
    noConnectionScreen: (context) => const NoConnection(),
    splashScreen: (context) => const SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    forgetScreen: (context) => const ForgotPasswordScreen(),
    homeScreen: (context) => HomeScreen(),

  };
}
