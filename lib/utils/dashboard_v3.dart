
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kwenchhonga/utils/tab_navigator.dart';


// @override
// Widget build(BuildContext context){
//   return Scaffold(
//     body: Stack(
//       children: <Widget>[
//         _buildOffStageNavigator("home");
//         _buildOffStageNavigator("notification");
//         _buildOffStageNavigator("plan");
//         _buildOffStageNavigator("transaction");
//         _buildOffStageNavigator("logout");
//       ],
//     ),
//     bottomNavigationBar: BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//         currentIndex: _selectedIndex,
//         onTap: (int index) => _selectedTab(pageKeys[index], index),
//         backgroundColor: const Color(0xFFBEDABE),
//         selectedItemColor: const Color(0xFF035301),
//         unselectedItemColor: const Color(0xFF000000),
//         selectedFontSize: 15.sp,
//         iconSize: 30.sm,
//         showUnselectedLabels: false,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//             // backgroundColor: Color(0xFF5E426B),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications),
//             label: 'Notification',
//             // backgroundColor: Color(0xFF5E426B),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_balance),
//             label: 'Plans',
//             // backgroundColor: Color(0xFF5E426B),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.attach_money),
//             label: 'Transaction',
//             // backgroundColor: Color(0xFF5E426B),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.logout),
//             label: 'Logout',
//             // backgroundColor: Color(0xFF5E426B),
//           ),
//         ],
//     ),
//   );
// }

// // void _selectedTab(String tabItem, int index) {
// //   setState((){
// //     _currentTab = pageKeys[index];
// //     _selectedIndex = index;
// //   });
// // }

// Widget _buildOffStageNavigator(String tabItem){
//   return Offstage(
//     offstage: _currentPage != tabItem,
//     child: TabNavigator(
//       navigatorKey: _navigatorKeys[tabItem],
//       tabItem: tabItem,
//     ),
//   );
// }