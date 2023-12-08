// ignore_for_file: use_build_context_synchronously
import 'package:connectivity/connectivity.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../utils/show_toast.dart';
import '../db/shared_pref.dart';
import 'api_exception.dart';

class ApiRepo {
  /*
***************************** TimeOut ***********************************
    sendTimeout: const Duration(milliseconds:300000),
    receiveTimeout: const Duration(milliseconds:300000),
     connectTimeout: const Duration(milliseconds: 300000),

************************ For Error Response *****************************
    receiveDataWhenStatusError: true,

***************************** Headers ***********************************
    HttpHeaders.authorizationHeader : "Bearer $token"
    HttpHeaders.contentTypeHeader : "application/json"
    HttpHeaders.acceptEncodingHeader: "*"
*/

  // Dio Initialization
  Dio dio = Dio();

  // Set BaseOption for Api Request
  Future<void> dioOption({required Map<String, dynamic> headers}) async {
    try {
      dio.options = BaseOptions(
          connectTimeout: const Duration(minutes: 2),
          sendTimeout: const Duration(minutes: 2),
          receiveTimeout: const Duration(minutes: 2),
          receiveDataWhenStatusError: true,
          headers: headers);
    } catch (e) {
      "Error $e";
    }
  }

  // ======================================================================
  //POST REQUEST
  // Getting four parameters
  // context => use for loader and navigation
  // screen =>  router name
  // url => url of the api
  // Map data => json data for api

  postRequest(BuildContext navigatorContext, String screen, String url,
      Map<String, dynamic> data,
      {String? bearerToken}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      showToast(message: 'Please check your internet connection.');
      return;
    }
    debugPrint(
        "Post Request=====================>>> \n URl : $url \n Sending data : $data");

    // Get the bearer token which we have stored in sharedPreferences before
    String? bearerToken = await LocalDb.getBearerToken;
    // debugPrint("Bearer token=====================>>>\n Token:$bearerToken");
    // Convert json (Map) to form data

    var formData = FormData.fromMap(data);

    // calling dioOption method to set base options
    await dioOption(headers: {
      if (bearerToken != null)
        HttpHeaders.authorizationHeader: "Bearer $bearerToken",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "*/*",
      'x-org-name': "cloud",
      'x-app-name': "main"
    });

    try {
      // Calling Api
      //debugPrint("Bearer token=====================>>>\n response:");

      final response = await dio.post(url, data: formData);
      // print('Shah${.toString()}');
      debugPrint("Bearer token=====================>>>\n response:$response");
      // return response back
      return response;
    } on DioException catch (exception) {
      if (exception.response!.statusCode == 422) {
        showToast(message: exception.response!.data['message']);
      } else if (exception.response!.statusCode == 401) {
        showToast(message: 'Bad Credentials!');
      } else if (exception.response!.statusCode == 404) {
        showToast(message: "The request return invalid status code of 404");
      } else if (exception.type == DioErrorType.receiveTimeout) {
        showToast(
            message:
            'Request timed out. You can retry or use fallback response.');
      } else if (exception.error is SocketException) {
        showToast(message: 'Please check your internet connection.');
      } else {
        showToast(message: '${exception.response!.data['message']}');
      }
      // If Exception Occur calling dioError method to Handle the Exception
      // return dioError(exception, navigatorContext, screen);
    }
  }


  // ======================================================================
  // GET REQUEST
  getRequest(BuildContext navigatorContext, String screen, String url,
      Map<String, dynamic> data,
      {String? bearerToken}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      showToast(message: 'Please check your internet connection.');
      return;
    }
    debugPrint(
        "Get Request=====================>>> \n URl : $url \n Sending data : $data");

    // Get the bearer token which we have stored in sharedPreferences before
    String? bearerToken = await LocalDb.getBearerToken;
    debugPrint("Bearer token=====================>>>\n Token:$bearerToken");

    // calling dioOption method to set base options
    await dioOption(headers: {
      if (bearerToken != null)
        HttpHeaders.authorizationHeader: "Bearer $bearerToken",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "*/*",
      'x-org-name': "cloud",
      'x-app-name': "main"
    });

    try {
      // Calling Api
      final response = await dio.get(url, queryParameters: data);

      // return response back
      return response;
    } on DioError catch (exception) {
      //If Exception Occur calling dioError method to Handle the Exception
      return dioError(exception, navigatorContext, screen);
    }
  }



  // ======================================================================
  // POST MULTIPART REQUEST
  //POST MULTIPART REQUEST
  //When we are uploading Media  like (image,file,video,audio,etc)
  //then we are using multipart request

  multipartRequest(BuildContext navigatorContext, String screen, String url,
      Map<String, dynamic> data, {String? bearerToken}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      showToast(message: 'Please check your internet connection.');
      return;
    }
    debugPrint(
        "Multipart Request=====================>>> \n URl : $url \n Sending data : $data");

    // Get the bearer token which we have stored in sharedPreferences before
    String? bearerToken = await LocalDb.getBearerToken;
    debugPrint("Bearer token=====================>>>\n Token:$bearerToken");

    // Convert json (Map) to form data
    var formData = FormData.fromMap(data);

    // calling dioOption method to set base options
    await dioOption(headers: {
      if (bearerToken != null)
        HttpHeaders.authorizationHeader: "Bearer $bearerToken",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "*/*",
      'x-org-name': "cloud",
      'x-app-name': "main"
    });

    try {
      // Calling Api
      final response = await dio.post(url, data: formData);

      // return response back
      return response;
    } on DioError catch (exception) {
      if(exception.response!.statusCode==422) {
        showToast(message: exception.response!.data['message']);
      }
      else if(exception.response!.statusCode==401) {
        showToast(message: "The request return invalid response code of 401");
      }
      else if(exception.response!.statusCode==405) {
        showToast(message: "The request return invalid response code of 405");
      }
      else if(exception.type == DioErrorType.receiveTimeout) {
        showToast(message: 'Request timed out. You can retry or use fallback response.');
      }else if(exception.error is SocketException){
        showToast(message: 'Please check your internet connection.');
      }
      else {
        showToast(message: '${exception.response!.data['message']}');
      }
      // If Exception Occur calling dioError method to Handle the Exception
      // return dioError(exception, navigatorContext, screen);
    }
  }

  // ======================================================================
  // Error Handling

  Future<dynamic> dioError(
      DioError exception, BuildContext navigatorContext, String screen) async {
    // if response is 400 OR 401 then we will return back API response otherwise we will navigate to  Error Screen
    if (exception.type == DioErrorType.badResponse) {
      if (exception.response!.statusCode == 400 ||
          exception.response!.statusCode == 401) {
        return exception.response;
      }
    }
    await Future.delayed(Duration.zero, () {
      apiException(exception, navigatorContext, screen);
    });
  }
}
