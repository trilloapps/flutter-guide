import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_demo/utils/extensions/widget_extension.dart';
import '../../utils/images.dart';

class CustomProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String imagePath;
  final VoidCallback? onViewTap;

  const CustomProfileCard({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.imagePath,
    this.onViewTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white, // Replace with your color
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                    color: Colors.white, // Add a border color if needed
                    width: 2)),
            child: ClipOval(
              child: imagePath == ""
                  ? Image.network(
                imagePath,
                fit: BoxFit.cover,
              )
                  : Image.asset(Images.profile),
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Name ',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12)),
                  Text('Email ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey.shade700)),
                  Text('Phone ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey.shade700)),
                  Text('Address ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey.shade700)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      name.length <= 20 ? name : name.substring(0, 20) + '...',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12)),
                  Text(email,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Colors.grey.shade700)),
                  Text(phone,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Colors.grey.shade700)),
                  Text(address,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Colors.grey.shade700)),
                ],
              ),
            ],
          ),

        ],
      ),
    ).paddingSymmetric(vertical: 8.h);
  }
}
