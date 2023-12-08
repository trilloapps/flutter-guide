import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_demo/data/model/connection_model.dart';
import 'package:test_demo/utils/extensions/int_extension.dart';
import 'package:test_demo/utils/extensions/string_extension.dart';
import 'package:test_demo/utils/extensions/widget_extension.dart';
import '../../utils/config_color.dart';
import '../../utils/extensions/border_extension.dart';
import '../../utils/images.dart';


class NoConnection extends StatelessWidget {
  const NoConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConnectionModel args =
    ModalRoute.of(context)!.settings.arguments as ConnectionModel;

    debugPrint("screen is : ${args.currentScreen}");
    debugPrint("message is : ${args.message}");

    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(true);
      },
      child: Scaffold(
        body: SizedBox(
          height: 896.h,
          width: 414.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 350.h,
                width: 350.h,
                child: Image.asset(
                  Images.error,
                ),
              ),
              args.message.toText(
                  fontSize: 20, color: menuColor,),
              100.height,
              Container(
                height: 50.h,
                width: 120.h,
                decoration: BoxDecoration(
                    borderRadius: borderRadiusCircular(50),
                    border: borderAll(color: menuColor, width: 1),
                    color: whitePrimary),
                child: "Try Again"
                    .toText(
                    fontSize: 16,
                    color: menuColor,
                    )
                    .center,
              ).onPress(() {
                Navigator.of(context).pop();
              })
            ],
          ).center,
        ),
      ),
    );
  }
}
