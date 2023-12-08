import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_demo/screens/widgets/custom_button.dart';
import 'package:test_demo/utils/diammensions.dart';
import 'package:test_demo/utils/extensions/string_extension.dart';
import 'package:test_demo/utils/extensions/widget_extension.dart';
import 'package:test_demo/utils/strings.dart';
import '../../helper/router_helper.dart';
import '../../provider/authentication_provider.dart';
import '../../utils/config_color.dart';
import '../../utils/images.dart';
import '../widgets/custom_textformfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailCont = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQuerySize(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Consumer<AuthenticationProvider>(
            builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 55.h,
                      ),
                      Image.asset(
                        Images.splashImage,
                        height: 140.h,
                        width: 120.w,
                        // fit: BoxFit.cover,
                      ).center,
                      SizedBox(
                        height: 35.h,
                      ),
                      forgotPassword.toText(
                        color: blackPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      forgotPasswordText.toText(
                        color: Colors.grey,
                        fontSize: 12.sp,
                        overflow: TextOverflow.visible,
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      CustomTextFields(
                        keyboardType: TextInputType.text,
                        obsecureText: false,
                        hintText: email,
                        iconData: Icons.email_outlined,
                        labeltext: enterEmail,
                        controller: provider.resetPasswordController, validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        // Regular expression for email validation
                        final RegExp emailRegex =
                        RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

                        if (!emailRegex.hasMatch(value)) {
                          return 'Enter a valid email address';
                        }

                        return null; // Return null for a valid input
                      },
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      provider.isForgotPasswordLoading
                          ? Center(
                        child: CircularProgressIndicator(
                          color: menuColor,
                        ),
                      )
                          : CustomButton(
                        buttonName: btnForgetPassword,
                        height: 40.h,
                        width: double.infinity,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            await provider.sendForgotPasswordRequest(
                                context); // Wait for the API request to complete
                          } else {
                            // Handle validation errors if needed
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(child: TextButton(onPressed: (){
                        provider.resetPasswordController.clear();
                        Navigator.pushNamed(
                            context, RouterHelpers.loginScreen);}, child: backtoLogin.toText(fontSize: 12.sp,color: menuColor,fontWeight: FontWeight.bold))),
                    ],
                  ).paddingSymmetric(horizontal: 22.w),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
