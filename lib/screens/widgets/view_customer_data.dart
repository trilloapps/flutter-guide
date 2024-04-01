import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_demo/utils/extensions/int_extension.dart';
import 'package:test_demo/utils/extensions/widget_extension.dart';
import '../../utils/images.dart';

class ViewCustomer extends StatelessWidget {
  final String name;
  final String email;
  final String imagePath;
  final VoidCallback? onEditTap;
  final String? date;
  final String phone;
  final String? status;
  final String? role;

  const ViewCustomer({
    Key? key,
    required this.name,
    this.date,
    this.status,
    required this.phone,
    required this.email,
    required this.imagePath,
    this.role,
    this.onEditTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: date != null ? 250.h : 160.h,
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
      child: Column(
        children: [
          Row(
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
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      return loadingProgress == null
                          ? child // Show the actual image when it's loaded
                          : const Center(
                          child:
                          CircularProgressIndicator()); // Show a simple CircularProgressIndicator during loading
                    },
                  )
                      : Image.asset(Images.profile),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Colors.grey.shade700),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: onEditTap,
                    child: Image.asset(
                      Images.edit,
                      height: 20,
                    ),
                  ),
                ],
              ).paddingOnly(right: 18),
            ],
          ).paddingOnly(top: 12, left: 16, right: 12),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (date != null) 12.height,
                  if (date != null)
                    const Text(
                      'Date Checked In',
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  12.height,
                  const Text(
                    'Phone',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  if (role != null) 12.height,
                  if (role != null)
                    const Text(
                      'Role',
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  if (status != null) 12.height,
                  if (status != null)
                    const Text(
                      'Status',
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                ],
              ),
              50.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (date != null) 12.height,
                  if (date != null)
                    Text(
                      date!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  12.height,
                  Text(
                    phone,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  if (role != null) 12.height,
                  if (role != null)
                    Text(
                      role!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  if (status != null) 12.height,
                  if (status != null)
                    Container(
                      height: 22.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffFFD6DE)),
                      child: Center(
                        child: Text(
                          status!,
                          style:
                          const TextStyle(color: Colors.red, fontSize: 10),
                        ).paddingSymmetric(horizontal: 5, vertical: 5),
                      ),
                    )
                ],
              ),
            ],
          ).paddingOnly(left: 35, top: 12, bottom: 12)
        ],
      ),
    ).paddingSymmetric(vertical: 8.h, horizontal: 12);
  }
}
