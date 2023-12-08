import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/auth_model.dart';

class LocalDb {
  static String bearerTokenKey = "accessToken";
  static String isLoginKey = "isLogin";
  static String userEmailKey = "userEmail";
  static String introScreen = "introScreen";
  static String userNameKey = "fullName";
  static String userPhoneKey = "userName";
  static String userKey = "user";
  static String userIdKey = "userId";
  static String fcmTokenKey = "fcmToken";

  //=============================================================================
  // Set bearer token
  static Future<void> storeBearerToken(String value) async {
    print('storeBearerToken' + value);
    // initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Store bearer token in shared preferences
    sharedPreferences.setString(bearerTokenKey, value);
    print(value);
  }

  // Get bearer token
  static Future<String?> get getBearerToken async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get the bearer token which we have stored in sharedPreferences before
    String? bearerToken = sharedPreferences.getString(bearerTokenKey);
    return bearerToken;
  }
  static Future<String?> getBearerTokenKey() async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get the bearer token which we have stored in sharedPreferences before
    String? bearerToken = sharedPreferences.getString(bearerTokenKey);
    return bearerToken;
  }
  //=============================================================================
  // Set FCM token
  static Future<void> storeFcmToken(String value) async {
    // initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Store fcm token in shared preferences
    sharedPreferences.setString(fcmTokenKey, value);
  }

  // Get FCM token
  static Future<String?> get getFcmToken async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get the fcm token which we have stored in sharedPreferences before
    String? fcmToken = sharedPreferences.getString(fcmTokenKey);
    return fcmToken;
  }

  //=============================================================================
  // Set user is Login
  static Future<void> storeLogin(bool value) async {
    // initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Store bearer token in shared preferences
    sharedPreferences.setBool(isLoginKey, value);
  }

  // Get user login Status
  static Future<bool?> get getLogin async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get the bearer token which we have stored in sharedPreferences before
    bool? isLogin = sharedPreferences.getBool(isLoginKey);
    return isLogin;
  }

  //=============================================================================
  // Store email of user
  static Future<void> storeUserEmail(String value) async {
    // initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Store email in shared preferences
    sharedPreferences.setString(userEmailKey, value);
  }

  // Get user email
  static Future<String?> get getUserEmail async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get the email which we have stored in sharedPreferences before
    String? userEmail = sharedPreferences.getString(userEmailKey);
    return userEmail;
  }

  //=============================================================================
  // Store Id of user
  static Future<void> storeUserId(int value) async {
    // initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Store user id in shared preferences
    sharedPreferences.setInt(userIdKey, value);
  }

  // Get user id
  static Future<int?> get getUserId async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get the user id which we have stored in sharedPreferences before
    int? userId = sharedPreferences.getInt(userIdKey);
    return userId;
  }

  //=============================================================================
  // Store name of user
  static Future<void> storeUserName(String value) async {
    // initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Store name in shared preferences
    sharedPreferences.setString(userNameKey, value);
  }

  // Get user email
  static Future<String?> get getUserName async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get the name which we have stored in sharedPreferences before
    String? userEmail = sharedPreferences.getString(userNameKey);
    return userEmail;
  }

  //=============================================================================
  // Store Phone number of user
  static Future<void> storeUserPhone(String value) async {
    // initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Store user phone number in shared preferences
    sharedPreferences.setString(userPhoneKey, value);
  }

  // Get user phone number
  static Future<String?> getUserPhone() async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get the user phone number which we have stored in sharedPreferences before
    String? userEmail = sharedPreferences.getString(userPhoneKey);
    return userEmail;
  }

  //=============================================================================
  // Store user record
  static Future<void> storeUser(dynamic value) async {
    // initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Store user phone number in shared preferences
    sharedPreferences.setString(userKey, jsonEncode(value));
  }

  // Get user record
  static Future<dynamic?> getUser() async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get the user phone number which we have stored in sharedPreferences before
    var myData = sharedPreferences.getString(userKey);
    var token;
    if (myData != null) {
      token = jsonDecode(myData);
    }
    return token;
  }


  // Save AuthModel data to SharedPreferences
  static Future<void> saveToPrefs(dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(userKey, jsonEncode(value));
  }

  // Load AuthModel data from SharedPreferences
  static Future<AuthModel?> loadFromPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(userKey);
      if (jsonString != null) {
        final jsonMap = jsonDecode(jsonString);
        return AuthModel.fromJson(jsonMap);
      }
    } catch (e) {
      print("Error loading data from SharedPreferences: $e");
    }
    return null;
  }


  // //=============================================================================
  // // Store email of user
  // static Future<void> storeIntroScreenValue(bool value) async {
  //   // initialized shared preferences
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   // Store email in shared preferences
  //   sharedPreferences.setBool(introScreen, value);
  // }
  //
  // // Get user email
  // static Future<bool?> get getIntroScreenValue async {
  //   // Initialized shared preferences
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   // Get the email which we have stored in sharedPreferences before
  //   bool? introScreenValue = sharedPreferences.getBool(introScreen);
  //   return introScreenValue;
  // }

  //=============================================================================
  // Clear shared preference

  static clearSharedPreferenceValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    // await storeIntroScreenValue(false);
  }
}
