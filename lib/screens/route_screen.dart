import 'package:flutter/material.dart';
import 'package:kwenchhonga/api/api_service.dart';
import 'package:kwenchhonga/screens/dashboard_v2.dart';
import 'package:kwenchhonga/screens/profile_edit.dart';
import 'package:kwenchhonga/utils/loading_screen.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({key}) : super(key: key);

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  APIService apiService = APIService();
  Widget page = const LoadingScreen();
  // ProfileModelClass profile = ProfileModelClass();

  @override
  void initState() {
    super.initState();
    checkProfile();
  }

  void checkProfile() async {
    var response = await apiService.getDataV2("/api/auth/profile/user/");
    if (response["fname"] == "" || response["lname"] == "") {
      setState(() {
        page = const profileScreen();
      });
    } else {
      setState(() {
        page = const dashboardScreenV2();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return page;
  }
}
