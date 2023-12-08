import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'helper/provider_helper.dart';
import 'helper/router_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Lock the screen orientation to portrait mode
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? widget) {
        return MultiProvider(
          providers: ProviderHelper.providers,
          child: MaterialApp(
              builder: (context, child) {
                return child!;
              },
              debugShowCheckedModeBanner: false,
              initialRoute: RouterHelpers.initial,
              routes: RouterHelpers.routes),
        );
      },
      designSize: const Size(360, 812),
    );
  }
}
