import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo/utils/extensions/int_extension.dart';
import 'package:test_demo/utils/extensions/string_extension.dart';
import 'package:test_demo/utils/extensions/widget_extension.dart';

import '../../../provider/customer_provider.dart';
import '../../../utils/config_color.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  late CustomerProvider customerProvider;

  @override
  void initState() {
    // TODO: implement initState
    customerProvider = Provider.of<CustomerProvider>(context, listen: false);
    customerProvider.getItemDetail(context, customerProvider.itemId.toString());
    super.initState();
  }

  Future<void> showEditDialog(BuildContext context) async {
    final provider = Provider.of<CustomerProvider>(context, listen: false);
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Consumer<CustomerProvider>(
                builder: (context, controller, child) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    'Edit'.toText(fontSize: 16, fontWeight: FontWeight.bold),
                    Icon(
                      Icons.cancel,
                      size: 25,
                      color: Colors.grey,
                    ).onPress(() {
                      Navigator.pop(context);
                    }),
                  ],
                ),
                content: Container(
                  height: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Code'.toText(),
                      5.height,
                      Container(
                        height: 35,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade300,
                        ),
                        child: provider.itemCode
                            .toString()
                            .toText(fontSize: 13)
                            .paddingSymmetric(vertical: 8, horizontal: 5),
                      ),
                      10.height,
                      'Weight'.toText(),
                      5.height,
                      Container(
                        height: 35,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade300,
                        ),
                        child: provider.weight
                            .toString()
                            .toText(fontSize: 13)
                            .paddingSymmetric(vertical: 8, horizontal: 10),
                      ),
                      10.height,
                      'Quantity'.toText(),
                      5.height,
                      TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        controller: provider.quantityController,
                        decoration: InputDecoration(
                          fillColor: whitePrimary,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: menuColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          hintText: 'Quantity',
                          hintStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade300)),
                          child: const Center(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ).onPress(() {
                          Navigator.pop(context);
                        }).paddingOnly(bottom: 12, left: 12),
                        12.width,
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade800,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Center(
                            child: 'Save'.toText(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ).onPress(() {
                          provider.editItem(context, provider.itemId.toString(),
                              provider.quantityController.text);
                        }).paddingOnly(bottom: 12, left: 12),
                      ],
                    ),
                  ),
                ],
              );
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CustomerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sample App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade800,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.itemDetail.length,
              itemBuilder: (context, index) {
                final itemsData = controller.itemDetail[index];
                String itemDescription = itemsData.itemDescription.toString();
                if (itemDescription.length > 65) {
                  // Insert line breaks after every 3 characters
                  itemDescription = itemDescription.replaceAllMapped(
                    RegExp(r'.{65}'),
                    (Match match) => '${match.group(0)}\n',
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        'Item Details'
                            .toText(fontSize: 16, fontWeight: FontWeight.bold),
                        GestureDetector(
                          onTap: () {
                            controller.itemId = itemsData.id.toString();
                            controller.quantity = itemsData.quantity.toString();
                            controller.weight = itemsData.weight.toString();
                            controller.itemCode = itemsData.itemCode.toString();
                            customerProvider.quantityController.text =
                                customerProvider.quantity.toString();
                            showEditDialog(context);
                          },
                          child: Container(
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blue.shade800),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                2.width,
                                'Edit'.toText(color: Colors.white, fontSize: 13)
                              ],
                            ).paddingSymmetric(horizontal: 5),
                          ),
                        )
                      ],
                    ).paddingSymmetric(horizontal: 0, vertical: 10),
                    Container(
                      height: 250,
                      child: Image.network(
                        itemsData.picture,
                        fit: BoxFit.fill,
                      ),
                    ),
                    4.width,
                    itemsData.itemName.toText(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    RichText(
                      maxLines: null,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: itemDescription,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            'Code: '.toText(
                                fontWeight: FontWeight.bold, fontSize: 14),
                            'Weight: '.toText(
                                fontWeight: FontWeight.bold, fontSize: 14),
                            'Quantity: '.toText(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            itemsData.itemCode.toText(
                              fontSize: 14,
                            ),
                            itemsData.weight.toText(
                              fontSize: 14,
                            ),
                            itemsData.quantity.toText(
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ).paddingSymmetric(horizontal: 10);
              },
            ),
          )
        ],
      ),
    );
  }
}
