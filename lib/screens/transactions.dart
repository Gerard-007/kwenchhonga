import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kwenchhonga/api/api_service.dart';
import 'package:kwenchhonga/models/transaction_model.dart';
import 'package:kwenchhonga/utils/connection_error.dart';
import 'package:kwenchhonga/utils/constants.dart';
import 'package:kwenchhonga/utils/error_screen.dart';
import 'package:kwenchhonga/utils/loading_screen.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({key}) : super(key: key);

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final APIService _apiService = APIService();

  Future<List<TransactionModelClass>> getTransactionData() async {
    var response = await _apiService.getData("/api/transactions/");
    print(response);
    final transactionModelClass = transactionModelClassFromMap(response);
    List<TransactionModelClass> transaction = transactionModelClass;
    return transaction;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: getTransactionData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const LoadingScreen();
              }
              if (snapshot.hasError) {
                return const ErrorScreen();
              }
              if (snapshot.hasData) {
                print("transaction_data ${snapshot.data}");
                if (snapshot.data.length != 0) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 35.w, vertical: 15.h),
                          child: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.circular(10.r),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 15.sp, top: 7.sp, bottom: 7.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xFFEAFFEA),
                              ),
                              height: 100.h,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.payments,
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
                                              "Purchased ${snapshot.data[index].planName}\n",
                                          style: TextStyle(
                                            fontFamily: 'Baloo2',
                                            fontSize: 14.sm,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "₦${snapshot.data[index].transactionAmount}\n",
                                          style: TextStyle(
                                            fontFamily: 'Baloo2',
                                            fontSize: 20.sm,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "status: ${snapshot.data[index].status}\n",
                                          style: TextStyle(
                                            fontFamily: 'Baloo2',
                                            fontSize: 12.sm,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                        TextSpan(
                                          text: DateFormat.yMEd()
                                              .add_jms()
                                              .format(snapshot
                                                  .data[index].timestamp),
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
                        );
                      });
                } else {
                  return const EmptyTransactionScreen();
                }
              }
              return const ConnectionError();
            }),
      ),
    );
  }
}
