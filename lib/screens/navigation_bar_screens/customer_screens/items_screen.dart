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

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  late CustomerProvider customerProvider;

  @override
  void initState() {
    // TODO: implement initState
    customerProvider=Provider.of<CustomerProvider>(context,listen: false);
    customerProvider.getItems(context, customerProvider.orderID.toString());
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
        body: controller.items.isNotEmpty? ListView.builder(
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            final itemsData = controller.items[index];
          return GestureDetector(
                onTap: (){
                  controller.itemDetail=[];
                 controller.itemId= itemsData.id.toString();
                 Navigator.pushNamed(context, RouterHelpers.itemDetails);
                },
                child: CustomProfileCard(
                  customerName: 'Name ',
                  customerEmail: 'Description ',
                  customerPhone: 'Code ',
                  imagePath: 'rtygfd',
                  customerAddress: 'Weight',
                  name: '${itemsData.itemName}',
                  email: itemsData.itemDescription.toString(),
                  phone: itemsData.itemCode,
                  bookingDate: itemsData.weight,
                )
            );
          },
        ):Center(
          child:Text('Not Found!'),
        )
    );
  }
}
