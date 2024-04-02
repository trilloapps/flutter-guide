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
        body: Column(
          children: [
            Row(
              children: [
                'Items'
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
                      hintText: 'Search by Name',
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

            controller.items.isNotEmpty? Expanded(
              child: ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final itemsData = controller.items[index];
                  final itemName = '${itemsData.itemName}';
                  if (controller.searchController.text.isEmpty ||
                      itemName.toLowerCase().contains(controller.searchController.text.toLowerCase())){
                    return GestureDetector(
                        onTap: (){
                          controller.itemDetail=[];
                          controller.itemId= itemsData.id.toString();
                          controller.searchController.clear();
                          Navigator.pushNamed(context, RouterHelpers.itemDetails);
                        },
                        child: CustomProfileCard(
                          customerName: 'Name ',
                          customerEmail: 'Description ',
                          customerPhone: 'Code ',
                          imagePath2: itemsData.picture,
                          customerAddress: 'Weight',
                          name: '${itemsData.itemName}',
                          email: itemsData.itemDescription.toString(),
                          phone: itemsData.itemCode,
                          bookingDate: itemsData.weight,
                        )
                    );
                  }else{
                    return Container();
                  }
                },
              ),
            ):Center(
              child:Text('Not Found!'),
            ),
          ],
        )
    );
  }
}
