import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../data/db/shared_pref.dart';
import '../data/model/auth_model.dart';
import '../data/repository/api_repo.dart';
import '../helper/router_helper.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../utils/api_urls.dart';
import '../utils/show_toast.dart';

class AuthenticationProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController tenantController = TextEditingController();
  TextEditingController resetPasswordController = TextEditingController();

  ///when user type again remove validation from textFormField///
  bool hideError = false;

  void showError(bool show) {
    hideError = !show;
    notifyListeners();
  }

  bool isVisible = false;
  void passwordVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  bool remember = false;
  void toggleSelect() {
    remember = !remember;
    notifyListeners();
  }

  ApiRepo apiRepo = ApiRepo();
  AuthModel authModel = AuthModel();
  AuthModel updatedAuthModel = AuthModel();

  /// Sign in User API ///
  bool isSignInLoading = false;
  signInUser(BuildContext context) async {
    FocusManager.instance.primaryFocus!.unfocus();
    isSignInLoading = true;
    notifyListeners();
    try {
      dynamic data = {
        'j_username': emailController.text.trim(),
        'j_password': passwordController.text.trim(),
        'tenant_display_name': tenantController.text.trim(),
      };
      Response response = await apiRepo.postRequest(
        context,
        RouterHelpers.noConnectionScreen,
        ApiUrl.logInUrl,
        data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isSignInLoading = false;
        notifyListeners();
        if (response.data['status'] == 'connected') {
          authModel = AuthModel.fromJson(response.data);
          SplashScreen.accessTokenValueNotifier.value = authModel.accessToken!;
          await LocalDb.storeBearerToken(authModel.accessToken!);
          await LocalDb.storeUserName(authModel.user!.fullName!.toString());
          var token = await LocalDb.getBearerToken;
          if (remember) {
            LocalDb.storeUser(authModel);
          }
          print(token);
          emailController.clear();
          passwordController.clear();
          tenantController.clear();
          Navigator.pushNamed(
            context,
            RouterHelpers.navBar,
          );
        } else {
          showToast(message: response.data['message']);
        }
      }
    } catch (e) {
      isSignInLoading = false;
      notifyListeners();
      print(e);
    }
  }

  /// Forgot password API ===>
  bool isForgotPasswordLoading = false;
  Future<void> sendForgotPasswordRequest(BuildContext context) async {
    isForgotPasswordLoading = true;
    notifyListeners();
    final url = Uri.parse(ApiUrl.forgotPasswordUrl);
    final data = {"email": resetPasswordController.text.trim()};
    try {
      final response = await http.post(
        url,
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json",
          'Accept': "*/*",
          'x-org-name': "cloud",
          'x-app-name': "main"
        },
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        debugPrint("Response is $responseData");
        isForgotPasswordLoading = false;
        notifyListeners();
        if (responseData['status'] == 'success') {
          Navigator.pop(context);
          showSuccessToast(message: 'Email Sent Successfully');
          Navigator.pushNamedAndRemoveUntil(
              context, RouterHelpers.loginScreen, (route) => false);
          resetPasswordController.clear();
        } else {
          showToast(message: responseData['message']);
        }
      } else {
        print("Error: ${response.statusCode}");
        print("Response body: ${response.body}");
        if (response.statusCode == 422) {
          showToast(message: json.decode(response.body)['message']);
          print(response.statusCode == 422);
        } else if (response.statusCode == 401) {
          showToast(message: 'Bad Credentials!');
        } else if (response.statusCode == 404) {
          showToast(
              message: "The request returned an invalid status code of 404");
        } else {
          showToast(message: 'An error occurred: ${response.reasonPhrase}');
        }
      }
    } catch (e) {
      isForgotPasswordLoading = false;
      notifyListeners();
      print(e);
      if (e is SocketException) {
        showToast(message: 'Please check your internet connection.');
      } else {
        showToast(message: 'An error occurred: $e');
      }
    } finally {
      isForgotPasswordLoading = false;
      notifyListeners();
    }
  }
}
