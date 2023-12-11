import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_demo/utils/extensions/int_extension.dart';
import '../../utils/diammensions.dart';

class CustomCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String percent;
  final String imageUrl;
  final String? imageIcon;
  Color color;
  EdgeInsets? padding;
  EdgeInsets? iconPadding;  final String? icon;

  CustomCardWidget(
      {required this.title,
        required this.subtitle,
        this.padding,this.icon,
        required this.color,
        required this.percent,
        required this.imageUrl,
        this.imageIcon,
        this.iconPadding});

  @override
  Widget build(BuildContext context) {
    mediaQuerySize(context);
    return Card(
      elevation: 4,
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r), color: Colors.white),
        child: Row(
          children: [
            SizedBox(
              width: 24.w,
            ),
            if (padding != null)
              Padding(
                padding: padding!,
                child: Image(
                  image: AssetImage(imageUrl),
                  height: 40.h,
                ),
              ),
            // Image.asset(imageUrl, height: 40.h),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.height,
                Text(title,
                    style:
                    TextStyle(fontSize: 12.sp, color: Colors.grey.shade700)),
                4.height,
                Row(
                  children: [
                    Text(subtitle,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold)),
                    12.width,
                    if (iconPadding != null)
                      Padding(
                        padding: iconPadding!,
                        child: Row(
                          children: [
                            if (icon != null)
                              Image.asset(
                                icon!,
                                //color: Colors.black,
                                width: 12.w, // Set the width of the image
                                height: 9.h,
                              ),
                            Text(
                              percent,
                              style: TextStyle(color: color, fontSize: 11.sp),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
            // SizedBox(width: 120.w),
            // if (iconPadding != null)
            //   Padding(
            //     padding: iconPadding!,
            //     child: Image.asset(imageIcon, height: 20),
            //   ),
          ],
        ),
      ),
    );
  }
}
