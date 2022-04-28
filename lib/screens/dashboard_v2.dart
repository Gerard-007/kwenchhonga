import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kwenchhonga/screens/home.dart';
import 'package:kwenchhonga/screens/logout.dart';
import 'package:kwenchhonga/screens/notification.dart';
import 'package:kwenchhonga/screens/plans.dart';
import 'package:kwenchhonga/screens/transactions.dart';

class dashboardScreenV2 extends StatelessWidget {
  const dashboardScreenV2({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: const Color(0xFFBEDABE),
        activeColor: const Color(0xFF035301),
        inactiveColor: const Color(0xFF000000),
        iconSize: 30.sm,
        //currentIndex: ,
        //onTap: ,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            // backgroundColor: Color(0xFF5E426B),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
            // backgroundColor: Color(0xFF5E426B),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Plans',
            // backgroundColor: Color(0xFF5E426B),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Transaction',
            // backgroundColor: Color(0xFF5E426B),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
            // backgroundColor: Color(0xFF5E426B),
          ),
        ],
      ),
      // ignore: missing_return
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: HomeScreen(),
              );
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: NotificationScreen(),
              );
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: PlansScreen(),
              );
            });
          case 3:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: TransactionScreen(),
              );
            });
          case 4:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: logoutScreen(),
              );
            });
        }
      },
    );
  }
}
