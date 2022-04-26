import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kwenchhonga/api/api_service.dart';
import 'package:kwenchhonga/models/plan_model.dart';
import 'package:kwenchhonga/screens/plan_payment.dart';
import 'package:kwenchhonga/utils/connection_error.dart';
import 'package:kwenchhonga/utils/constants.dart';
import 'package:kwenchhonga/utils/error_screen.dart';
import 'package:kwenchhonga/utils/loading_screen.dart';
import 'package:humanize/humanize.dart' as humanize;

class PlansScreen extends StatefulWidget {
  const PlansScreen({key}) : super(key: key);

  @override
  _PlansScreenState createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  final APIService _apiService = APIService();

  Future<List<PlanModelClass>> getPlanData() async {
    var response = await _apiService.getData("/api/plans/");
    final planModelClass = planModelClassFromMap(response);
    List<PlanModelClass> plan = planModelClass;
    return plan;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getPlanData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const LoadingScreen();
            }
            if (snapshot.hasError) {
              return const ErrorScreen();
            }
            if (snapshot.hasData) {
              print("notification_data ${snapshot.data}");
              if (snapshot.data.length != 0) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 28.w,
                          vertical: 15.h,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            var plan = snapshot.data[index];
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return planPaymentScreen(plan);
                              }),
                            );
                          },
                          child: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.circular(10.r),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 14.sp, top: 4.sp, bottom: 7.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xFFEAFFEA),
                              ),
                              height: 100.h,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.shopping_bag,
                                    size: 45.sp,
                                    color: const Color(0xFF327531),
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
                                              "${snapshot.data[index].title}\n",
                                          style: TextStyle(
                                            fontFamily: 'Baloo2',
                                            fontSize: 14.sm,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "Price ₦${humanize.intComma(double.parse(snapshot.data[index].price).toInt())}\n",
                                          style: TextStyle(
                                            fontFamily: 'Baloo2',
                                            fontSize: 12.sm,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "₦${humanize.intComma(double.parse(snapshot.data[index].price).toInt())} monthly for 12 months ₦${humanize.intComma(double.parse(snapshot.data[index].price).toInt() * 12)}\n",
                                          style: TextStyle(
                                            fontFamily: 'Baloo2',
                                            fontSize: 10.sm,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "${snapshot.data[index].description}\n",
                                          style: TextStyle(
                                            fontFamily: 'Baloo2',
                                            fontSize: 10.sm,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        // TextSpan(
                                        //   text: "+Health Insurance",
                                        //   style: TextStyle(
                                        //     fontFamily: 'Baloo2',
                                        //     fontSize: 12.sm,
                                        //     fontWeight: FontWeight.w500,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return const EmptyNotificationScreen();
              }
            }
            return const ConnectionError();
          },
        ),
      ),
    );
  }

  void action() {}
}



/**
 * SizedBox(
                height: 20.h,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: "Available Slots\n",
                      style: TextStyle(
                        fontFamily: 'Baloo2',
                        fontSize: 25.sm,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: "choose a slot to proceed to payment",
                      style: TextStyle(
                        fontFamily: 'Baloo2',
                        fontSize: 14.sm,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
 */
