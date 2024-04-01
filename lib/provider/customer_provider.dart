
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import '../data/model/customer_model.dart';
import '../data/model/orders_models.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../utils/api_urls.dart';
import '../utils/show_toast.dart';

class CustomerProvider with ChangeNotifier{


  List<Customer> customer=[];
  Future<void> getCustomerData(BuildContext context) async {
    try {
      final dio = Dio();
      final response = await dio.post(
        ApiUrl.customerData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'x-org-name': 'cloud',
            'x-app-name': 'main',
            'Authorization': 'Bearer ${SplashScreen.accessTokenValueNotifier.value}',
          },
        ),
        data: {'start': 1, 'size': 10},
      );

      if (response.statusCode == 200) {
        final jsonData = response.data;
        if (jsonData['status'] == 'success') {
          final customerData = CustomerData.fromJson(jsonData['data']);
          customer = customerData.customers.cast<Customer>();
          notifyListeners();
        } else {
          if (response.statusCode == 401) {
            showToast(message: 'Authentication failed. Please login again.');
          } else {
            showToast(message: jsonData['message']);
          }
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  List<Order> orders=[];
  Future<void> getCustomerOrders(BuildContext context, String id) async {
    try {
      final dio = Dio();
      final response = await dio.post(
        ApiUrl.getCustomerOrders,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'x-org-name': 'cloud',
            'x-app-name': 'main',
            'Authorization': 'Bearer ${SplashScreen.accessTokenValueNotifier.value}',
          },
        ),
        data: {
          'customerId': id,
          'start': 1, 'size': 10
        },
      );

      if (response.statusCode == 200) {
        final jsonData = response.data;
        if (jsonData['status'] == 'success') {
          final orderData = OrderData.fromJson(jsonData['data']);
          orders = orderData.orders.cast<Order>();
          notifyListeners();
        } else {
          if (response.statusCode == 401) {
            showToast(message: 'Authentication failed. Please login again.');
          } else {
            showToast(message: jsonData['message']);
          }
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }


}