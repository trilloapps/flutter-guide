import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo/data/model/customer_model.dart';
import 'package:test_demo/helper/router_helper.dart';
import 'package:test_demo/provider/customer_provider.dart';
import 'package:test_demo/utils/extensions/int_extension.dart';
import 'package:test_demo/utils/extensions/string_extension.dart';
import 'package:test_demo/utils/extensions/widget_extension.dart';
import '../../../utils/config_color.dart';
import '../../widgets/customer_data_widget.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CustomerProvider>(context,listen: false).getCustomerData(context);
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
      body:  Column(
        children: [
          Row(
            children: [
              'Customers'
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
          Expanded(
            child: ListView.builder(
              itemCount: controller.customer.length,
              itemBuilder: (context, index) {
                final customers = controller.customer[index];
                final fullName = '${customers.firstName} ${customers.lastName}';

                // Check if the search query matches the full name or either first name or last name
                if (controller.searchController.text.isEmpty ||
                    fullName.toLowerCase().contains(controller.searchController.text.toLowerCase()) ||
                    customers.firstName.toLowerCase().contains(controller.searchController.text.toLowerCase()) ||
                    customers.lastName.toLowerCase().contains(controller.searchController.text.toLowerCase())) {
                  return GestureDetector(
                    onTap: () {
                      controller.customerId = customers.id.toString();
                      controller.searchController.clear();
                      Navigator.pushNamed(context, RouterHelpers.orderScreen);
                    },
                    child: CustomProfileCard(
                      customerName: 'Name ',
                      customerEmail: 'Email ',
                      customerPhone: 'Phone ',
                      customerAddress: 'Address ',
                      name: fullName,
                      email: customers.email,
                      imagePath: customers.profilePicture ?? "",
                      phone: customers.phone,
                      address: customers.address,
                      status: 'Status ',
                      statusValue: customers.status,
                      color: Colors.green,
                      color2: Colors.red,
                    ),
                  );
                } else {
                  // If the search query does not match, return an empty container
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
