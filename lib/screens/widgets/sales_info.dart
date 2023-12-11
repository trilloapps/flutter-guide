import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_demo/utils/extensions/widget_extension.dart';

import '../../utils/diammensions.dart';

class SalesInfoCard extends StatelessWidget {
  final String title;
  final String value;
  final String? text;
  final String? percentageChange;
  EdgeInsets? padding;
  EdgeInsets? percentagePadding;
  Color color;

  SalesInfoCard(
      {required this.title,
        required this.value,
        this.text,
        this.percentageChange,required this.color,
        this.padding,
        this.percentagePadding});

  @override
  Widget build(BuildContext context) {
    mediaQuerySize(context);
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400, // Grey color for the shadow
            blurRadius: 5.0, // Adjust the blur radius as needed
            offset: Offset(0, 3), // Adjust the offset as needed
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  color: Colors.grey.shade600,
                ),
              ),
              Row(
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 4),
                ],
              ),
            ],
          ).paddingOnly(left: 30, top: 15.h),
          if (percentageChange != null &&
              percentagePadding !=
                  null) // Check if percentageChange is provided
            Padding(
              padding: percentagePadding!,
              child: Text(
                '${percentageChange!}',
                style: TextStyle(
                    color: color,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          if (text != null &&
              padding != null) // Check if percentageChange is provided
            Padding(
              padding: padding!,
              child: Text(
                text!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            )
        ],
      ),
    ).paddingSymmetric(horizontal: 18.w, vertical: 1);
  }
}
