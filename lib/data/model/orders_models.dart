import 'dart:convert';

class OrderData {
  final int totalData;
  final List<Order> orders;

  OrderData({
    required this.totalData,
    required this.orders,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      totalData: json['totalData'],
      orders: List<Order>.from(json['orders'].map((x) => Order.fromJson(x))),
    );
  }
}

class Order {
  final String orderNo;
  final int bookingDateTime;
  final String description;
  final String title;
  final int deliverDateTime;
  final int createdAt;
  final int deletedAt;
  final int deleted;
  final dynamic test;
  final String customerId;
  final int id;
  final dynamic orderDate;
  final int updatedAt;
  final String status;

  Order({
    required this.orderNo,
    required this.bookingDateTime,
    required this.description,
    required this.title,
    required this.deliverDateTime,
    required this.createdAt,
    required this.deletedAt,
    required this.deleted,
    required this.test,
    required this.customerId,
    required this.id,
    required this.orderDate,
    required this.updatedAt,
    required this.status,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderNo: json['orderNo'],
      bookingDateTime: json['bookingDateTime'] is String ? int.tryParse(json['bookingDateTime']) ?? 0 : json['bookingDateTime'],
      description: json['description'],
      title: json['title'],
      deliverDateTime: json['deliverDateTime'] is String ? int.tryParse(json['deliverDateTime']) ?? 0 : json['deliverDateTime'],
      createdAt: json['createdAt'] is String ? int.tryParse(json['createdAt']) ?? 0 : json['createdAt'],
      deletedAt: json['deletedAt'] is String ? int.tryParse(json['deletedAt']) ?? 0 : json['deletedAt'],
      deleted: json['deleted'] is String ? int.tryParse(json['deleted']) ?? 0 : json['deleted'],
      test: json['Test'],
      customerId: json['customerId'],
      id: json['id'] is String ? int.tryParse(json['id']) ?? 0 : json['id'] ?? 0,
      orderDate: json['orderDate'],
      updatedAt: json['updatedAt'] is String ? int.tryParse(json['updatedAt']) ?? 0 : json['updatedAt'] ?? 0,
      status: json['status'] ?? '',
    );
  }
}
