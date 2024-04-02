import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test_demo/data/model/customer_model.dart';
import 'package:test_demo/helper/router_helper.dart';
import 'package:test_demo/provider/customer_provider.dart';
import 'package:test_demo/screens/widgets/view_customer_data.dart';
import 'package:test_demo/utils/extensions/widget_extension.dart';
import 'package:test_demo/utils/show_toast.dart';
import 'dart:core';
import '../../widgets/customer_data_widget.dart';

class CustomerOrderScreen extends StatefulWidget {
  const CustomerOrderScreen({super.key});

  @override
  State<CustomerOrderScreen> createState() => _CustomerOrderScreenState();
}

class _CustomerOrderScreenState extends State<CustomerOrderScreen> {
  late CustomerProvider customerProvider;

  @override
  void initState() {
    // TODO: implement initState
    customerProvider=Provider.of<CustomerProvider>(context,listen: false);
    customerProvider.getCustomerOrders(context, customerProvider.customerId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller=Provider.of<CustomerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample App', style: TextStyle(color: Colors.white,),),
        backgroundColor: Colors.blue.shade800,
        automaticallyImplyLeading: true,
      ),
      body: controller.orders.isNotEmpty? ListView.builder(
        itemCount: controller.orders.length,
        itemBuilder: (context, index) {
          final customersOrders = controller.orders[index];
          // Convert bookingDateTime and deliverDateTime to DateTime objects
          final bookingDateTime = DateTime.fromMillisecondsSinceEpoch(customersOrders.bookingDateTime );
          final deliveryTime = DateTime.fromMillisecondsSinceEpoch(customersOrders.deliverDateTime );
          // Convert DateTime objects to local time and then to string
          final bookingDateTimeString = DateFormat('yyyy-MM-dd hh:mm a').format(bookingDateTime.toLocal());
          final deliveryTimeString = DateFormat('yyyy-MM-dd hh:mm a').format(deliveryTime.toLocal());
          return GestureDetector(
            onTap: (){
              controller.orderID=customersOrders.id.toString();
              Navigator.pushNamed(context, RouterHelpers.itemsScreen);
            },
            child: CustomProfileCard(
              customerName: 'Order ID ',
              customerEmail: 'Title ',
              customerPhone: 'Description ',
              status: 'Status ',
              name: '${customersOrders.orderNo}',
              email: customersOrders.title,
              phone: customersOrders.description,
              statusValue: customersOrders.status,
              color: Colors.yellow,
              color2: Colors.blue,
              booking: "Booking Date",
              delivery: "Delivery Time",
              bookingDate: bookingDateTimeString,
              deliveryTime: deliveryTimeString,
            )
          );
        },
      ):Center(
        child:Text('Not Found!'),
      )
    );
  }
}
