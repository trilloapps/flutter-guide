
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:test_demo/data/model/item_details.dart';
import 'package:test_demo/data/model/items_model.dart';

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
  String? customerId;
  String? orderID;
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

  List<Item> items=[];
  Future<void> getItems(BuildContext context, String id,) async {
    try {
      final dio = Dio();
      final response = await dio.post(
        ApiUrl.getOrderItems,
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
          'orderId': id,
          'start': 1, 'size': 10
        },
      );

      if (response.statusCode == 200) {
        final jsonData = response.data;
        if (jsonData['status'] == 'success') {
          final itemData = ItemData.fromJson(jsonData['data']);
          items = itemData.items.cast<Item>();
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

  List<ItemDetails> itemDetail=[];
  String? itemId;
  String? imageUrl;
  Future<void> getItemDetail(BuildContext context, String id) async {
    try {
      final dio = Dio();
      final response = await dio.post(
        ApiUrl.getItemDetails,
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
          'itemId': id,
        },
      );

      if (response.statusCode == 200) {
        final jsonData = response.data;
        if (jsonData['status'] == 'success') {
          final itemData = ItemDetails.fromJson(jsonData['data']);
          imageUrl=itemData.picture.toString();
          itemDetail.add(itemData);
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

  String? quantity;
  String? itemCode;
  String? weight;
  TextEditingController quantityController=TextEditingController();
  Future<void> editItem(BuildContext context, String id,String quantity) async {
    try {
      final dio = Dio();
      final response = await dio.post(
        ApiUrl.editItem,
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
          'lineItemId': id,
          'quantity': quantity,
        },
      );

      if (response.statusCode == 200) {
        final jsonData = response.data;
        if (jsonData['status'] == 'success') {
          quantity=quantityController.text;
          showSuccessToast(message: 'Item Edit SuccessFully!');
          Navigator.pop(context);
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