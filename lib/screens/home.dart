import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kwenchhonga/api/api_service.dart';
import 'package:kwenchhonga/models/user_model.dart';
import 'package:humanize/humanize.dart' as humanize;
import 'package:kwenchhonga/screens/transactions.dart';
import 'package:kwenchhonga/screens/withdrawal_screen.dart';
import 'package:kwenchhonga/utils/connection_error.dart';
import 'package:kwenchhonga/utils/error_screen.dart';
import 'package:kwenchhonga/utils/loading_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final APIService _apiService = APIService();

  @override
  void initState() {
    super.initState();
  }

  Future<User> getUserData() async {
    var response = await _apiService.getData("/api/auth/user/");
    // ignore: avoid_print
    // print("User-Response : $response");
    UserModelClass userModelClass = userModelClassFromMap(response);
    // ignore: avoid_print
    User user = userModelClass.user;
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: getUserData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const LoadingScreen();
              }
              if (snapshot.hasError) {
                return const ErrorScreen();
              }
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 20.h,
                        ),
                        CircleAvatar(
                            radius: 30.r,
                            backgroundColor: const Color(0xFF327531),
                            backgroundImage:
                                NetworkImage(snapshot.data.profile.avatarUrl)
                            // child: Text(
                            //   'GN',
                            //   style: TextStyle(
                            //     fontFamily: 'Baloo2',
                            //     fontSize: 15.sp,
                            //     // fontWeight: FontWeight.w700,
                            //   ),
                            // ),
                            ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          snapshot.data.username,
                          style: TextStyle(
                            fontFamily: 'Baloo2',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          snapshot.data.email,
                          style: TextStyle(
                            fontFamily: 'Baloo2',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 16.sp, top: 10.sp, bottom: 10.sp),
                          height: 160.h,
                          // width: 275.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                            color: const Color(0xFF327531),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Previous Payment\n",
                                            style: TextStyle(
                                              fontFamily: 'Baloo2',
                                              fontSize: 14.sm,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "Plan: ${snapshot.data.profile.pastPlanName}\n",
                                            style: TextStyle(
                                              fontFamily: 'Baloo2',
                                              fontSize: 12.sm,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "₦${humanize.intComma(snapshot.data.profile.pastPlanPrice.toInt())}",
                                            style: TextStyle(
                                              fontFamily: 'Baloo2',
                                              fontSize: 25.sm,
                                              fontWeight: FontWeight.w100,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 25.w,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const WithdrawalScreen(),
                                            // const profileScreen(),
                                          ),
                                        );
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(
                                              vertical: 1.h, horizontal: 10.w),
                                        ),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            // side: BorderSide(color: Colors.red),
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          // ignore: prefer_const_constructors
                                          Icon(
                                            Icons.payment,
                                            color: const Color(0xFFA9FF3A),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          const Text("withdraw"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Balance\n",
                                            style: TextStyle(
                                              fontFamily: 'Baloo2',
                                              fontSize: 12.sm,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "₦${humanize.intComma(snapshot.data.myBalance.toInt())}",
                                            style: TextStyle(
                                              fontFamily: 'Baloo2',
                                              fontSize: 15.sm,
                                              fontWeight: FontWeight.w100,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 75.w),
                                    RichText(
                                      text: TextSpan(
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Pending Revenue\n",
                                            style: TextStyle(
                                              fontFamily: 'Baloo2',
                                              fontSize: 10.sm,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "₦${humanize.intComma(snapshot.data.profile.pendingBalance.toInt())}",
                                            style: TextStyle(
                                              fontFamily: 'Baloo2',
                                              fontSize: 10.sm,
                                              fontWeight: FontWeight.w100,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Text(
                          "My Recent transactions",
                          style: TextStyle(
                            fontFamily: 'Baloo2',
                            fontSize: 20.sm,
                            fontWeight: FontWeight.w100,
                            // color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.circular(10.r),
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 15.sp, top: 7.sp, bottom: 7.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: const Color(0xFFEAFFEA),
                            ),
                            height: 90.h,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.payments,
                                  size: 30.sp,
                                ),
                                SizedBox(
                                  width: 26.w,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            "Purchased ${snapshot.data.profile.pastPlanName} plan\n",
                                        style: TextStyle(
                                          fontFamily: 'Baloo2',
                                          fontSize: 14.sm,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "₦${humanize.intComma(snapshot.data.profile.pastPlanPrice.toInt())}\n",
                                        style: TextStyle(
                                          fontFamily: 'Baloo2',
                                          fontSize: 20.sm,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                      TextSpan(
                                        text: DateFormat.yMEd()
                                            .add_jms()
                                            .format(snapshot
                                                .data.profile.pastPlanDate),
                                        style: TextStyle(
                                          fontFamily: 'Baloo2',
                                          fontSize: 12.sm,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const ConnectionError();
            }),
      ),
    );
  }

  //======Navigate to signup page====
  void transactionPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TransactionScreen(),
      ),
    );
  }

  // //_______/ get user data /_________
  // Future<void> getUserData() async {
  //   SharedPreferences _pref = await SharedPreferences.getInstance();
  //   String? token = _pref.getString("login");
  //   print(token);
  //   // String url = "$baseUrl/api/auth/user/";
  //   var _response = await http.get(
  //     Uri.parse("$baseUrl/api/auth/user/"),
  //     headers: {"Authorization": "Bearer $token"},
  //   );
  //   if (_response.statusCode == 200) {
  //     String data = _response.body;
  //     // return jsonDecode(data);
  //     UserModelClass userModelClass = userModelClassFromMap(data);
  //     // ignore: avoid_print
  //     print(userModelClass.user.email);
  //     List<Transaction> arrTransData = userModelClass.user.userTransactions;
  //     List<Plan> arrPlansData = userModelClass.user.plans;
  //     print(arrPlansData[0].price);
  //   } else {
  //     // ignore: avoid_print
  //     print(_response.statusCode);
  //   }
  // }
  // //_______/ get user data /_________
}
