import 'package:flutter/material.dart';
import 'package:test_demo/data/db/shared_pref.dart';
import 'package:test_demo/helper/router_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                LocalDb.clearSharedPreferenceValue();
                Navigator.pushNamed(
                  context,
                  RouterHelpers.loginScreen,
                );
              },
              child: Text("Logout"))
        ],
      ),
    );
  }
}
