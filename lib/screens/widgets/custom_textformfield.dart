import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../provider/authentication_provider.dart';
import '../../utils/config_color.dart';

class CustomTextFields extends StatelessWidget {
  final TextEditingController controller;
  final String labeltext;
  final String hintText;
  final String? labelStyle;
  final Icon? suffixIcon;
  final IconData? iconData;
  bool obsecureText;
  bool isVisible;
  bool formSubmitted;
  VoidCallback? onSuffixIconTap;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;


  CustomTextFields(
      {this.isVisible = false,
        this.formSubmitted = false,
        required this.keyboardType,
        this.onSuffixIconTap,
        required this.hintText,
        required this.labeltext,
        required this.controller,
        required this.obsecureText,
        this.suffixIcon,
        this.labelStyle,
        required this.validator,
        this.iconData});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
          labelText: labeltext,
          fillColor: fieldColor,
          errorText: formSubmitted ? '$labeltext is required' : null,
          contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 16.w),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300)),
          suffixIcon: suffixIcon != null
              ? GestureDetector(
            onTap: onSuffixIconTap,
            child: suffixIcon,
          )
              : null,
          hintText: hintText,
          prefixIcon: Icon(iconData),
          labelStyle: TextStyle(fontSize: 12.sp),
        ),
        validator: validator,
        onChanged: (value) {
          authProvider.showError(false);
        },
      ),
    );
  }
}
