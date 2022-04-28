import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kwenchhonga/screens/plans.dart';

class transactionSuccessfulScreen extends StatefulWidget {
  const transactionSuccessfulScreen({key}) : super(key: key);

  @override
  State<transactionSuccessfulScreen> createState() =>
      _transactionSuccessfulScreenState();
}

class _transactionSuccessfulScreenState
    extends State<transactionSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 35.h,
              ),
              Text(
                "Transaction Successful",
                style: TextStyle(
                  fontFamily: 'Baloo2',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              const Icon(
                Icons.done_outline_rounded,
                color: Color(0xFF327531),
                size: 200,
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.sp,
                  vertical: 10.sp,
                ),
                height: 140.h,
                width: 320.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                  color: const Color(0xFFEAFFEA),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Slot Type:",
                      style: TextStyle(
                        fontFamily: 'Baloo2',
                        fontSize: 15.sm,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Revenue 1 month:",
                      style: TextStyle(
                        fontFamily: 'Baloo2',
                        fontSize: 15.sm,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Revenue 12 month:",
                      style: TextStyle(
                        fontFamily: 'Baloo2',
                        fontSize: 15.sm,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Product worth:",
                      style: TextStyle(
                        fontFamily: 'Baloo2',
                        fontSize: 15.sm,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Plan details here...",
                      style: TextStyle(
                        fontFamily: 'Baloo2',
                        fontSize: 15.sm,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Material(
                elevation: 2.0,
                borderRadius: BorderRadius.circular(10.r),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF327531)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 17.h, horizontal: 80.w),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(Icons.account_balance),
                      SizedBox(
                        width: 5.w,
                      ),
                      const Text("back to plans"),
                    ],
                  ),
                  onPressed: () {
                    print("Get back to plans");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const PlansScreen();
                      }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
