import 'package:flutter/material.dart';

class ConnectionError extends StatelessWidget {
  const ConnectionError({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: const Color(0xFF327531),
      body: const SafeArea(
        child: Center(
          child: Text(
            "No Internet Connection\n please check your internrt connection",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Baloo2',
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
