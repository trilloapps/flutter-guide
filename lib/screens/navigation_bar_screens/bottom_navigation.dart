import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_demo/screens/navigation_bar_screens/customer_screens/customer_screen.dart';
import 'package:test_demo/screens/navigation_bar_screens/user_page.dart';
import 'package:test_demo/utils/images.dart';
import '../../provider/bottom_nav_provider.dart';
import '../../utils/config_color.dart';
import 'home_screen.dart';

class BottomNavigateBar extends StatefulWidget {
  @override
  State<BottomNavigateBar> createState() => _BottomNavigateBarState();
}

class _BottomNavigateBarState extends State<BottomNavigateBar> {
  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavigationProvider>(context);

    return Scaffold(
      body: _getPage(bottomNavProvider.selectedIndex), // Add your pages here
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Set type to fixed
        selectedItemColor: menuColor, // Set the selected item color
        unselectedItemColor: Colors.black, // Set the unselected item color
        showUnselectedLabels: true, // Set this property to true
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Customer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: bottomNavProvider.selectedIndex,
        onTap: (index) {
          bottomNavProvider.updateIndex(index);
        },
      ),
    );
  }

  Widget _getPage(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return CustomerScreen();
      case 1:
        return UserPage();
      default:
        return Text('Invalid Screen');
    }
  }
}
