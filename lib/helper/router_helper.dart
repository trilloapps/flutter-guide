
import 'package:flutter/material.dart';
import 'package:test_demo/screens/authentication/login.dart';
import 'package:test_demo/screens/navigation_bar_screens/customer_screens/customer_orders_screen.dart';
import 'package:test_demo/screens/navigation_bar_screens/customer_screens/item_detail_screen.dart';
import 'package:test_demo/screens/navigation_bar_screens/customer_screens/items_screen.dart';
import 'package:test_demo/screens/navigation_bar_screens/user_page.dart';

import '../data/model/item_details.dart';
import '../screens/authentication/forget.dart';
import '../screens/navigation_bar_screens/bottom_navigation.dart';
import '../screens/navigation_bar_screens/home_screen.dart';
import '../screens/no_connection/no_connection.dart';
import '../screens/splash_screen/splash_screen.dart';


class RouterHelpers {
  static const initial = "/";
  static const noConnectionScreen = "/noConnectionScreen";
  static const String splashScreen = '/';
  static const String loginScreen = '/login_screen';
  static const String forgetScreen = '/forgetScreen';
  static const String navBar = '/navBar';
  static const String homeScreen = '/homeScreen';
  static const String userPage = '/userPage';
  static const String orderScreen = '/orderScreen';
  static const String itemsScreen = '/itemsScreen';
  static const String itemDetails = '/itemDetails';


  ///Screen////
  static Map<String, Widget Function(BuildContext context)> routes = {
    navBar: (context) => BottomNavigateBar(),
    userPage:(context) => UserPage(),
    noConnectionScreen: (context) => const NoConnection(),
    splashScreen: (context) => const SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    forgetScreen: (context) => const ForgotPasswordScreen(),
    homeScreen: (context) => HomeScreen(),
    orderScreen: (context) => CustomerOrderScreen(),
    itemsScreen: (context) => ItemsScreen(),
    itemDetails: (context) => ItemDetailsScreen(),
  };
}
