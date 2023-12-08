// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_demo/utils/extensions/string_extension.dart';
import 'package:test_demo/utils/extensions/widget_extension.dart';
import 'package:test_demo/utils/images.dart';
import '../../data/db/shared_pref.dart';
import '../../data/model/auth_model.dart';
import '../../helper/router_helper.dart';
import '../../provider/authentication_provider.dart';
import '../../utils/config_color.dart';
import '../../utils/diammensions.dart';
import '../../utils/strings.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  AuthModel authModel = AuthModel();

  @override
  Widget build(BuildContext context) {
    mediaQuerySize(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: Scaffold(
        body: Consumer<AuthenticationProvider>(
          builder: (BuildContext, provider, child) {
            return Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 45.h,
                      ),
                      Image.asset(
                        Images.splashImage,
                        height: 120.h,
                        width: 100.w,
                        // fit: BoxFit.cover,
                      ).center,
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          signIn.toText(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                          helloTherePleaseLoginFirst.toText(
                            color: Colors.grey,
                            fontSize: 10.sp,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomTextFields(
                            keyboardType: TextInputType.text,
                            obsecureText: false,
                            hintText: userId,
                            iconData: Icons.email_outlined,
                            labeltext: userId,
                            controller: provider.emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'UserID is required';
                              }
                              return null;
                            },
                          ),
                          CustomTextFields(
                            suffixIcon: Icon(
                              provider.isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off_rounded,
                              color: Colors.grey,
                            ),
                            keyboardType: TextInputType.text,
                            hintText: password,
                            labeltext: password,
                            controller: provider.passwordController,
                            isVisible: provider.isVisible,
                            iconData: Icons.lock,
                            obsecureText: !provider
                                .isVisible, // Pass the inverse of isVisible
                            onSuffixIconTap: () {
                              provider.passwordVisibility(); // Toggle visibility
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              return null; // Return null for a valid input
                            },
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 15.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  provider.toggleSelect();
                                  if (provider.remember) {
                                    LocalDb.storeUser(authModel);
                                  } else {
                                    LocalDb.clearSharedPreferenceValue();
                                  }
                                },
                                child: Checkbox(
                                  value: provider.remember,
                                  activeColor: menuColor,
                                  side:
                                  BorderSide(color: Colors.grey, width: 1.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.r),
                                  ),
                                  onChanged: (newValue) {
                                    provider.toggleSelect();
                                  },
                                ),
                              ),
                              rememberMe.toText(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          InkWell(
                            child: forget
                                .toText(
                              fontSize: 12.sp,
                              color: menuColor,
                              fontWeight: FontWeight.w500,
                            )
                                .paddingOnly(right: 5.w),
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  RouterHelpers.forgetScreen, (route) => false);
                            },
                          ),
                        ],
                      ).paddingOnly(right: 4.w),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Column(
                        children: [
                          provider.isSignInLoading
                              ? const Center(
                            child: CircularProgressIndicator(
                              color: menuColor,
                            ),
                          )
                              : CustomButton(
                            buttonName: login,
                            height: 40.h,
                            width: double.infinity,
                            textSize: 16.sp,
                            textWeight: FontWeight.w600,
                            pressColor: whitePrimary,
                            onPressed: () {
                              provider.showError(true);
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                provider.signInUser(context);
                              } else {}
                            },
                          ),

                        ],
                      ).paddingSymmetric(horizontal: 10.w),
                    ],
                  ).paddingSymmetric(horizontal: 18.w),
                ),
              ).paddingOnly(top: 50.h),
            );
          },
        ),
      ),
    );
  }
}
