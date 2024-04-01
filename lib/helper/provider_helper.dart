import 'package:provider/provider.dart';
import 'package:test_demo/provider/bottom_nav_provider.dart';
import 'package:test_demo/provider/customer_provider.dart';
import 'package:test_demo/provider/home_provider.dart';
import '../provider/authentication_provider.dart';

class ProviderHelper {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<AuthenticationProvider>(
        create: (context) => AuthenticationProvider()),
    ChangeNotifierProvider<BottomNavigationProvider>(
        create: (context) => BottomNavigationProvider()),
    ChangeNotifierProvider<HomeProvider>(
        create: (context) => HomeProvider()),
    ChangeNotifierProvider<CustomerProvider>(
        create: (context) => CustomerProvider()),
  ];
}
