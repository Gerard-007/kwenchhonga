import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kwenchhonga/screens/login.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({key}) : super(key: key);

  @override
  _signupScreenState createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 49.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 21.h,
                ),
                Image.asset(
                  "assets/images/kwenchhonga-removebg1.png",
                  width: 150.w,
                  height: 150.h,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Form(
                  child: Column(
                    children: <Widget>[
                      Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(10.r),
                        child: TextFormField(
                          // onSaved: () {},
                          // validator: () {},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.w),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.w),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 22.w, vertical: 17.h),
                            fillColor: const Color(0xFFEAFFEA),
                            hintText: "First name",
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(10.r),
                        child: TextFormField(
                          // onSaved: () {},
                          // validator: () {},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.w),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.w),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 22.w, vertical: 17.h),
                            fillColor: const Color(0xFFEAFFEA),
                            hintText: "Last name",
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(10.r),
                        child: TextFormField(
                          // onSaved: () {},
                          // validator: () {},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.w),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.w),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 22.w, vertical: 17.h),
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
                        height: 25.h,
                      ),
                      Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(10.r),
                        child: TextFormField(
                          // onSaved: () {},
                          // validator: () {},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.w),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.w),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 22.w, vertical: 17.h),
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
                      SizedBox(
                        height: 25.h,
                      ),
                      Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(10.r),
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF035301)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
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
                          child: const Text("Register"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: LoginPage,
                      child: Text(
                        "Login",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: 'TitilliumWeb',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF5E426B),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //======Navigate to signup page====
  void LoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const loginScreen(),
      ),
    );
  }
}
