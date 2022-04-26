import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kwenchhonga/api/api_service.dart';
import 'package:kwenchhonga/models/notification_model.dart';
import 'package:kwenchhonga/utils/connection_error.dart';
import 'package:kwenchhonga/utils/constants.dart';
import 'package:kwenchhonga/utils/error_screen.dart';
import 'package:kwenchhonga/utils/loading_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final APIService _apiService = APIService();

  Future<List<NotificationModelClass>> getNotificationData() async {
    var response = await _apiService.getData("/api/notifications/");
    final notificationModelClass = notificationModelClassFromMap(response);
    List<NotificationModelClass> notification = notificationModelClass;
    return notification;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getNotificationData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(10.r),
                        child: Container(
                          padding: EdgeInsets.only(left: 20.sp),
                          height: 90.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: const Color(0xFFEAFFEA),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.notifications_active,
                                size: 45.sp,
                                color: const Color(0xFF327531),
                              ),
                              SizedBox(
                                width: 18.w,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "${snapshot.data[index].getType}\n",
                                      style: TextStyle(
                                        fontFamily: 'Baloo2',
                                        fontSize: 15.sm,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "${snapshot.data[index].message}\n"
                                          .toLowerCase(),
                                      style: TextStyle(
                                        fontFamily: 'Baloo2',
                                        fontSize: 10.sm,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "${snapshot.data[index].fromSystem}\n",
                                      style: TextStyle(
                                        fontFamily: 'Baloo2',
                                        fontSize: 13.sm,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                    TextSpan(
                                      text: DateFormat.yMEd()
                                          .add_jms()
                                          .format(snapshot.data[index].date),
                                      style: TextStyle(
                                        fontFamily: 'Baloo2',
                                        fontSize: 12.sm,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              IconButton(
                                onPressed: () {
                                  _apiService.deleteData(
                                      "/api/notifications/${snapshot.data[index].id}/");
                                  // ignore: avoid_print
                                  print("deleted");
                                  //===Display snack bar if user was successful.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "notification was successfully deleted."),
                                    ),
                                  );
                                  //Refresh notification page
                                  Navigator.of(context, rootNavigator: true)
                                      .pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NotificationScreen()),
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
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

  // DateTime getDate(String datetime) {
  //   final dateString = DateFormat().format(datetime as DateTime);
  //   var newDateTimeObj = DateFormat().add_yMd().add_Hms().parse(dateString);
  //   return newDateTimeObj;
  // }
}
