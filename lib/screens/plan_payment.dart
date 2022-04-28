import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kwenchhonga/api/api_service.dart';
import 'package:kwenchhonga/models/plan_model.dart';
import 'package:kwenchhonga/models/user_model_v2.dart';
import 'package:kwenchhonga/screens/payment_page.dart';
import 'package:kwenchhonga/screens/plans.dart';
import 'package:humanize/humanize.dart' as humanize;

// ignore: camel_case_types
class planPaymentScreen extends StatefulWidget {
  final PlanModelClass plan;

  const planPaymentScreen(this.plan, {key}) : super(key: key);

  @override
  State<planPaymentScreen> createState() => _planPaymentScreenState();
}

// ignore: camel_case_types
class _planPaymentScreenState extends State<planPaymentScreen> {
  PlanModelClass getPlan;
  final apiService = APIService();
  CurrentUserModelClass currentUser = CurrentUserModelClass();
  bool circular = false;

  @override
  void initState() {
    super.initState();
    getPlan = widget.plan;
    // ignore: avoid_print
    print("plan price ${getPlan.price}");
    getUserDetails();
  }

  void getUserDetails() async {
    var res = await apiService.getDataV2("/api/auth/user/");
    setState(() {
      currentUser = CurrentUserModelClass.fromJson(res);
      print(currentUser.user.email);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const PlansScreen();
                      }),
                    );
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back_ios),
                      Text(
                        "Back",
                        style: TextStyle(
                          fontFamily: 'Baloo2',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  "Transaction Status",
                  style: TextStyle(
                    fontFamily: 'Baloo2',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 50.h,
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
                        "Slot Type: ${getPlan.title}",
                        style: TextStyle(
                          fontFamily: 'Baloo2',
                          fontSize: 15.sm,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Product worth: ₦${humanize.intComma(double.parse(getPlan.price).toInt())}",
                        style: TextStyle(
                          fontFamily: 'Baloo2',
                          fontSize: 15.sm,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Revenue 1 month: ₦${humanize.intComma(double.parse(getPlan.commission).toInt())}",
                        style: TextStyle(
                          fontFamily: 'Baloo2',
                          fontSize: 15.sm,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Revenue 12 month: ₦${humanize.intComma(double.parse(getPlan.commission).toInt() * 12)}",
                        style: TextStyle(
                          fontFamily: 'Baloo2',
                          fontSize: 15.sm,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        getPlan.description,
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
                  height: 70.h,
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
                    child: circular
                        ? const SpinKitThreeInOut(
                            color: Colors.white,
                            size: 20.0,
                          )
                        : Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Icon(Icons.security),
                              SizedBox(
                                width: 5.w,
                              ),
                              const Text("Proceed to Payment"),
                            ],
                          ),
                    onPressed: () async {
                      if (currentUser.user.email == null ||
                          currentUser.user.email == "") {
                        setState(() {
                          circular = true;
                        });
                        return null;
                      } else {
                        // ignore: avoid_print
                        print("Pay with paystack...");
                        MakePayment(
                          ctx: context,
                          email: currentUser.user.email,
                          fullname: currentUser.user.profile.fullName,
                          price: double.parse(getPlan.price).toInt(),
                          plan: getPlan.title,
                        ).chargeCardAndmakePayment();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
