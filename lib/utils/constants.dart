import 'package:flutter/material.dart';
import 'package:kwenchhonga/screens/withdrawal_screen.dart';

const baseUrl = 'https://kwenchhonga.herokuapp.com';

class EmptyNotificationScreen extends StatelessWidget {
  const EmptyNotificationScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "No notification for now",
        ),
      ),
    );
  }
}

class EmptyTransactionScreen extends StatelessWidget {
  const EmptyTransactionScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "No transaction so far",
        ),
      ),
    );
  }
}

class ConstKY {
  // ignore: constant_identifier_names
  static const String PYSTCK_KY =
      "pk_test_deccf766e2b4ccaf1481e28f39003a23b22785a4";
}
