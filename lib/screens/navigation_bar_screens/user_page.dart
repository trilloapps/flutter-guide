import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_demo/provider/home_provider.dart';
import 'package:test_demo/utils/extensions/int_extension.dart';
import 'package:test_demo/utils/extensions/string_extension.dart';
import 'package:test_demo/utils/extensions/widget_extension.dart';

import '../../data/db/shared_pref.dart';
import '../../data/model/auth_model.dart';
import '../../helper/router_helper.dart';
import '../../provider/authentication_provider.dart';
import '../../provider/bottom_nav_provider.dart';
import '../../utils/config_color.dart';
import '../../utils/diammensions.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../widgets/sales_info.dart';
import 'package:intl/intl.dart';

class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AuthModel authModel = AuthModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavigationProvider>(context);
    final authProvider = Provider.of<AuthenticationProvider>(context);
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    mediaQuerySize(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sample App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
        actions: [
          IconButton(
            onPressed: () {
              LocalDb.clearSharedPreferenceValue();
              Navigator.pushNamed(
                context,
                RouterHelpers.loginScreen,
              );
            },
            icon: Icon(Icons.logout_outlined),
            color: Colors.black,
          )
        ],
      ),
      backgroundColor: whitePrimary,
      key: _scaffoldKey,
      body: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          if (provider.apiData != null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container(
              width: double.infinity,
              color: Colors.blue.shade50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome back ${authProvider.authModel.user?.fullName ?? 'Bruce Banner'}",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  3.height,
                  Container(
                    width: 85.w,
                    height: 85.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image(
                          image: AssetImage(Images.user),
                          fit: BoxFit.cover,
                        )),
                  ).paddingOnly(left: 95.w, right: 95.w, top: 21.h, bottom: 2),
                  Text(
                    authProvider.authModel.user?.fullName ?? 'Bruce Banner',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  demoApp.toText(fontSize: 13.sp, color: Color(0xff64748B)),

                ],
              ),
            );
          }
        },
      ),
    );
  }
}
