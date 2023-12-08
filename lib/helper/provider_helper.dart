import 'package:provider/provider.dart';
import 'package:test_demo/provider/bottom_nav_provider.dart';

import '../provider/authentication_provider.dart';

class ProviderHelper {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<AuthenticationProvider>(
        create: (context) => AuthenticationProvider()),
    // ChangeNotifierProvider<BottomNavigationProvider>(
    //     create: (context) => BottomNavigationProvider()),

  ];
}
