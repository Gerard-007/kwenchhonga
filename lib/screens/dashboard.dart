// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kwenchhonga/screens/logout.dart';
// import 'package:kwenchhonga/screens/plans.dart';
// import 'package:kwenchhonga/screens/transactions.dart';

// import 'home.dart';
// import 'notification.dart';

// class dashboardScreen extends StatefulWidget {
//   const dashboardScreen({key}) : super(key: key);

//   @override
//   _dashboardScreenState createState() => _dashboardScreenState();
// }

// class _dashboardScreenState extends State<dashboardScreen> {
//   int currentIndex = 0;
//   final screens = const [
//     HomeScreen(),
//     NotificationScreen(),
//     PlansScreen(),
//     TransactionScreen(),
//     logoutScreen()
//   ];

//   // void loginScreen(){
//   //   if() {};
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: currentIndex,
//         children: screens,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: currentIndex,
//         backgroundColor: const Color(0xFFBEDABE),
//         selectedItemColor: const Color(0xFF035301),
//         unselectedItemColor: const Color(0xFF000000),
//         selectedFontSize: 15.sp,
//         iconSize: 30.sm,
//         showUnselectedLabels: false,
//         onTap: (index) => setState(() => currentIndex = index),
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
//       ),
//     );
//   }
// }
