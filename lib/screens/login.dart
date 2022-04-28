import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kwenchhonga/api/api_service.dart';
import 'package:kwenchhonga/screens/route_screen.dart';
import 'package:kwenchhonga/screens/signup.dart';
import 'package:kwenchhonga/utils/constants.dart';
import 'package:kwenchhonga/utils/loading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class loginScreen extends StatefulWidget {
  const loginScreen({key}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  Widget page = const LoadingScreen();
  Widget loading = const CircularProgressIndicator();
  final apiService = APIService();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //Handles Hide password functions
  bool hidePassword = true;

  bool loader = false;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    // HERE WE CHECK IF USER ALREADY LOGIN OR CREDENTIAL ALREADY AVAILABLE
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var val = _pref.getString("login");
    page = RouteScreen();
    if (val != null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 47.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 27.h,
                ),
                Image.asset(
                  "assets/images/kwenchhonga-removebg1.png",
                  width: 150.w,
                  height: 150.h,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Enter your credentials to login and view \n your dashboard",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Baloo2',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Form(
                  key: _form,
                  child: Column(
                    children: [
                      Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(10.r),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !value.contains("@")) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0.w,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.r,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0.w,
                              ),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 17.h,
                              horizontal: 21.w,
                            ),
                            fillColor: const Color(0xFFEAFFEA),
                            hintText: "Email",
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 38.h,
                      ),
                      Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(10.r),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 5) {
                              return "Enter password & password cannot be less than 5";
                            }
                            return null;
                          },
                          controller: _passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0.w,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.r,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0.w,
                              ),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 17.h,
                              horizontal: 21.w,
                            ),
                            fillColor: const Color(0xFFEAFFEA),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                            ),
                          ),
                          obscureText: hidePassword,
                        ),
                      ),
                      // SizedBox(
                      //   height: 7.h,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Text(
                      //       "Forgot password?",
                      //       style: TextStyle(
                      //         fontFamily: 'Baloo2',
                      //         fontSize: 14.sp,
                      //         fontWeight: FontWeight.w700,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(10.r),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF327531)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 18.h, horizontal: 117.w),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                          ),
                          child: loader
                              ? const SpinKitThreeInOut(
                                  color: Colors.white,
                                  size: 13,
                                )
                              : const Text("Login"),
                          onPressed: () {
                            setState(() {
                              loader = true;
                            });
                            loginNow();
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //======Navigate to signup page====
  void signupPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const signupScreen(),
      ),
    );
  }

  //======Navigate to dashboard page====
  void dashboardPage(String token) async {
    //===Here we store token inside shared preference
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    await _sharedPref.setString("login", token);
    //Navigate to page...
    page = const RouteScreen();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }

  //=====Login User...
  void loginNow() async {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      var _response = await http.post(
        Uri.parse('$baseUrl/api/auth/login/'),
        body: ({
          "email": _emailController.text,
          "password": _passwordController.text,
        }),
      );
      if (_response.statusCode == 200) {
        final body = jsonDecode(_response.body);
        //===print token if login was successful
        print("login token: " + body['token'].toString());

        //===Here we store token inside shared preference
        SharedPreferences _sharedPref = await SharedPreferences.getInstance();
        await _sharedPref.setString("user", body['email'].toString());
        //===Display snack bar if user was successful.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Successful"),
          ),
        );
        dashboardPage(body['token']);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid Credentials"),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const loginScreen(),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Blank Value Found"),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const loginScreen(),
        ),
      );
    }
  }

  //Go to profile once the user is logged in

  @override
  void deactivate() {
    super.deactivate();
    print("profile called");
  }
}
