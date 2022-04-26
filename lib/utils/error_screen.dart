import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kwenchhonga/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: const Color(0xFF327531),
      body: SafeArea(
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Session Expired",
              style: TextStyle(
                fontFamily: 'Baloo2',
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Material(
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
                child: const Text("Logout"),
                onPressed: () async {
                  SharedPreferences _pref =
                      await SharedPreferences.getInstance();
                  await _pref.clear();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const loginScreen()),
                      (route) => false);
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
