import 'package:flutter/material.dart';
import 'package:kwenchhonga/screens/home.dart';
import 'package:kwenchhonga/screens/logout.dart';
import 'package:kwenchhonga/screens/notification.dart';
import 'package:kwenchhonga/screens/plans.dart';
import 'package:kwenchhonga/screens/transactions.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  const TabNavigator({key, this.navigatorKey, this.tabItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (tabItem == "home") {
      child = const HomeScreen();
    } else if (tabItem == "navigation") {
      child = const NotificationScreen();
    } else if (tabItem == "plan") {
      child = const PlansScreen();
    } else if (tabItem == "transaction") {
      child = const TransactionScreen();
    } else if (tabItem == "logout") {
      child = const logoutScreen();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
