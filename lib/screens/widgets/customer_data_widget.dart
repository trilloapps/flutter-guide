import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_demo/utils/extensions/int_extension.dart';
import 'package:test_demo/utils/extensions/widget_extension.dart';
import '../../utils/images.dart';

class CustomProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
   String? address;
   String? customerName;
   String? customerEmail;
   String? customerPhone;
  String? customerAddress;
  String? status;
  String? statusValue;
  Color? color;
  Color? color2;
  String? colorValue;
  String? booking;
  String? delivery;
  String? bookingDate;
  String? deliveryTime;
   String? imagePath;
  final VoidCallback? onViewTap;

   CustomProfileCard({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
     this.address,
     this.imagePath,this.color,this.color2,this.colorValue,
     this.customerName,
     this.customerEmail,
     this.status,
     this.statusValue,this.booking,this.bookingDate,this.delivery,this.deliveryTime,
     this.customerPhone,
     this.customerAddress,
    this.onViewTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
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
          if(imagePath!=null)
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
                imagePath!,
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
                  if(customerName!=null)
                  Text(
                      customerName!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12)),
                  if(customerEmail!=null)
                    Text(customerEmail!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,)),
                  if(customerPhone!=null)
                    Text(customerPhone!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,)),
                  if(customerAddress!=null)
                    Text(customerAddress!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,)),
                  if(booking!=null)
                    Text(booking!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,)),
                  if(delivery!=null)
                    Text(delivery!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,)),
                  if(status!=null)
                    Text(status!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,)),
                  5.height,

                ],
              ),
              5.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      name.length <= 20 ? name : name.substring(0, 20) + '...',
                      style:  TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 12,
                          color: Colors.grey.shade800)),
                  Text(email.length <= 30 ? email : email.substring(0, 30) + '...',maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Colors.grey.shade700)),
                  Text(phone,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Colors.grey.shade700)),
                  if(address!=null)
                  Text(address!,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Colors.grey.shade700)),
                  if(bookingDate!=null)
                    Text(bookingDate!,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Colors.grey.shade700)),
                  if(deliveryTime!=null)
                    Text(deliveryTime!,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Colors.grey.shade700)),
                  if(statusValue!=null)
                  Container(
                    color: statusValue == 'active' ? color : (statusValue == 'processing' ? color : color2),
                    child: Text(statusValue!,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: statusValue == 'active' ? Colors.white : (statusValue == 'processing' ? Colors.black : Colors.white),)).paddingOnly(left: 4,right: 4,),
                  ),
                  5.height,
                ],
              ),
            ],
          ).paddingOnly(left: 10),

        ],
      ),
    ).paddingSymmetric(vertical: 8.h,horizontal: 12);
  }
}
