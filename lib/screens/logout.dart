import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kwenchhonga/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class logoutScreen extends StatefulWidget {
  const logoutScreen({key}) : super(key: key);

  @override
  State<logoutScreen> createState() => _logoutScreenState();
}

class _logoutScreenState extends State<logoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Material(
            elevation: 2.0,
            borderRadius: BorderRadius.circular(10.r),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF035301)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                    vertical: 18.h,
                    horizontal: 104.w,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              child: Text("Logout"),
              onPressed: () async {
                SharedPreferences _pref = await SharedPreferences.getInstance();
                await _pref.clear();
                Navigator.of(context, rootNavigator: true).pushReplacement(
                  MaterialPageRoute(builder: (context) => const loginScreen()),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
