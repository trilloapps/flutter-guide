import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_demo/utils/extensions/int_extension.dart';
import 'package:test_demo/utils/extensions/string_extension.dart';
import 'package:test_demo/utils/extensions/widget_extension.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Demo App',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          business.toText(fontWeight: FontWeight.bold, fontSize: 16.sp),
          8.height,
          CustomCardWidget(
            padding: EdgeInsets.only(),
            imageUrl: Images.cyt,
            title: 'Cases Year To Date',
            subtitle: '12345',
            percent: '99%',
            imageIcon: Images.retailor,
            color: Colors.green,
            icon: Images.arrowUp,
            iconPadding: EdgeInsets.only(
              left: 110.w,
            ),
          ),
          5.height,
          CustomCardWidget(
            padding: EdgeInsets.only(),
            imageUrl: Images.stores,
            title: 'Total Stores',
            subtitle: '12345',
            percent: '99%',
            imageIcon: Images.retailor,
            color: Colors.green,
            icon: Images.arrowUp,
            iconPadding: EdgeInsets.only(
              left: 110.w,
            ),
            // iconPadding: EdgeInsets.only(left: 110.w, bottom: 28),
          ),
        ],
      ).paddingSymmetric(vertical: 10, horizontal: 8.wt),
    );
  }
}
