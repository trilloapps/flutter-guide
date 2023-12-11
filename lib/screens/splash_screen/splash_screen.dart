import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_demo/data/db/shared_pref.dart';
import 'package:test_demo/utils/extensions/string_extension.dart';
import 'package:test_demo/utils/extensions/widget_extension.dart';
import 'package:test_demo/utils/strings.dart';
import '../../data/model/auth_model.dart';
import '../../helper/router_helper.dart';
import '../../provider/authentication_provider.dart';
import '../../utils/config_color.dart';
import '../../utils/images.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static ValueNotifier<String> accessTokenValueNotifier = ValueNotifier("");

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    routes();
  }

  void routes() async {
    var user = await LocalDb.getUser();
    String? token = await LocalDb.getBearerTokenKey();
    final authProvider =
    Provider.of<AuthenticationProvider>(context, listen: false);
    Timer(const Duration(seconds: 3), () {
      authProvider.authModel.accessToken = token;
      if (authProvider.authModel.accessToken!=null && user!=null) {
        SplashScreen.accessTokenValueNotifier.value =
        authProvider.authModel.accessToken!;
        authProvider.authModel = AuthModel.fromJson(user);
        Navigator.pushNamedAndRemoveUntil(
            context, RouterHelpers.navBar, (route) => false);
      } else  {
        Navigator.of(context).pushReplacementNamed(
          RouterHelpers.loginScreen,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Images.demo,
              height: 140.h,
              width: 120.w,
              // fit: BoxFit.cover,
            ).center,
            demoApp.toText(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
