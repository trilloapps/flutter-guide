// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:test_demo/utils/images.dart';
// import '../../provider/bottom_nav_provider.dart';
// import '../../utils/config_color.dart';
// import '../drawer/side_drawer.dart';
// import 'home_screen.dart';
//
//
// class BottomNavigateBar extends StatefulWidget {
//   @override
//   State<BottomNavigateBar> createState() => _BottomNavigateBarState();
// }
//
// class _BottomNavigateBarState extends State<BottomNavigateBar> {
//   @override
//   Widget build(BuildContext context) {
//     final bottomNavProvider = Provider.of<BottomNavigationProvider>(context);
//
//     return Scaffold(
//       body: Center(
//         child: _buildScreen(bottomNavProvider.selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed, // Set type to fixed
//         selectedItemColor: menuColor, // Set the selected item color
//         unselectedItemColor: Colors.black, // Set the unselected item color
//         showUnselectedLabels: true, // Set this property to true
//         items: [
//           BottomNavigationBarItem(
//             icon: ImageIcon(
//               const AssetImage(
//                 Images.home,
//               ),
//               color: Color(0xff2563EB),
//               size: 20.h,
//             ),
//             label: 'Home',
//           ),
//         ],
//         currentIndex: bottomNavProvider.selectedIndex,
//         onTap: (index) {
//           bottomNavProvider.setSelectedIndex(index);
//         },
//       ),
//       drawer: CustomDrawer(bottomNavigationProvider: bottomNavProvider),
//     );
//   }
//
//   Widget _buildScreen(int selectedIndex) {
//     switch (selectedIndex) {
//       case 0:
//         return HomeScreen();
//       default:
//         return Text('Invalid Screen');
//     }
//   }
// }
