import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo/data/model/customer_model.dart';
import 'package:test_demo/provider/customer_provider.dart';
import 'package:test_demo/screens/widgets/view_customer_data.dart';
import 'package:test_demo/utils/show_toast.dart';

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
      ),
      body:  ListView.builder(
        itemCount: controller.customer.length,
        itemBuilder: (context, index) {
          final customers = controller.customer[index];
            return GestureDetector(
              onTap: (){

              },
              child: CustomProfileCard(
                name:
                '${customers.firstName} ${customers.lastName}',
                email: customers.email,
                imagePath: customers.profilePicture ?? "",
                phone: customers.phone,
                address: customers.address,
              ),
            );
        },
      ),
    );
  }
}
