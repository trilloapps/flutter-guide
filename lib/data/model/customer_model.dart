import 'dart:convert';

class CustomerData {
  final int totalData;
  final List<Customer> customers;

  CustomerData({
    required this.totalData,
    required this.customers,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) {
    return CustomerData(
      totalData: json['totalData'],
      customers: List<Customer>.from(
          json['customers'].map((customer) => Customer.fromJson(customer))),
    );
  }
}

class Customer {
  final int createdAt;
  final String firstName;
  final String lastName;
  final String profilePicture;
  final int deletedAt;
  final int deleted;
  final String address;
  final String phone;
  final int id;
  final String email;
  final int updatedAt;
  final String status;

  Customer({
    required this.createdAt,
    required this.firstName,
    required this.lastName,
    required this.profilePicture,
    required this.deletedAt,
    required this.deleted,
    required this.address,
    required this.phone,
    required this.id,
    required this.email,
    required this.updatedAt,
    required this.status,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      createdAt: json['createdAt']??0,
      firstName: json['firstName']??'',
      lastName: json['lastName']??'',
      profilePicture: json['profilePicture']??'',
      deletedAt: json['deletedAt']??0,
      deleted: json['deleted']??0,
      address: json['address']??'',
      phone: json['phone']??'',
      id: json['id']??0,
      email: json['email']??'',
      updatedAt: json['updatedAt']??0,
      status: json['status']??'',
    );
  }
}
