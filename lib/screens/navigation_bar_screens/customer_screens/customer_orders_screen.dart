import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test_demo/data/model/customer_model.dart';
import 'package:test_demo/helper/router_helper.dart';
import 'package:test_demo/provider/customer_provider.dart';
import 'package:test_demo/screens/widgets/view_customer_data.dart';
import 'package:test_demo/utils/extensions/int_extension.dart';
import 'package:test_demo/utils/extensions/string_extension.dart';
import 'package:test_demo/utils/extensions/widget_extension.dart';
import 'package:test_demo/utils/show_toast.dart';
import 'dart:core';
import '../../../utils/config_color.dart';
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            customerProvider.searchController.clear();
            Navigator.of(context).pop(); // Go back
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              'Orders'
                  .toText(fontSize: 16, fontWeight: FontWeight.bold),
              10.width,
              Expanded(
                child: TextFormField(
                  controller: controller.searchController,
                  onChanged: (Value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    hintText: 'Search by Title',
                    hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: menuColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.grey.shade500),
                    ),
                    fillColor: whitePrimary,
                    filled: true,
                  ),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 12, vertical: 10),

          controller.orders.isNotEmpty? Expanded(
            child: ListView.builder(
              itemCount: controller.orders.length,
              itemBuilder: (context, index) {
                final customersOrders = controller.orders[index];
                final title = '${customersOrders.title}';

                // Convert bookingDateTime and deliverDateTime to DateTime objects
                final bookingDateTime = DateTime.fromMillisecondsSinceEpoch(customersOrders.bookingDateTime );
                final deliveryTime = DateTime.fromMillisecondsSinceEpoch(customersOrders.deliverDateTime );
                // Convert DateTime objects to local time and then to string
                final bookingDateTimeString = DateFormat('yyyy-MM-dd hh:mm a').format(bookingDateTime.toLocal());
                final deliveryTimeString = DateFormat('yyyy-MM-dd hh:mm a').format(deliveryTime.toLocal());
                if (controller.searchController.text.isEmpty ||
                    title.toLowerCase().contains(controller.searchController.text.toLowerCase()) ||
                    customersOrders.title.toLowerCase().contains(controller.searchController.text.toLowerCase())){
                  return GestureDetector(
                      onTap: (){
                        controller.orderID=customersOrders.id.toString();
                        controller.searchController.clear();
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
                }else{
                  return Container();
                }
              },
            ),
          ):              Center(child: CircularProgressIndicator()),

    ],
      )
    );
  }
}
