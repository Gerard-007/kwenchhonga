import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kwenchhonga/api/api_service.dart';
import 'package:kwenchhonga/screens/transaction_success.dart';
import 'package:kwenchhonga/utils/constants.dart';
import 'package:kwenchhonga/utils/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MakePayment {
  MakePayment({
    this.ctx,
    this.price,
    this.email,
    this.plan,
    this.fullname,
  });

  BuildContext ctx;
  int price;
  String email;
  String fullname;
  String plan;

  PaystackPlugin paystack = PaystackPlugin();
  APIService apiService;

  //Reference
  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }
    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  //GetUI
  PaymentCard _getCardUI() {
    return PaymentCard(number: "", cvc: "", expiryMonth: 0, expiryYear: 0);
  }

  Future initializePlugin() async {
    await paystack.initialize(publicKey: ConstKY.PYSTCK_KY);
  }

  //Method charging card
  chargeCardAndmakePayment() async {
    initializePlugin().then((_) async {
      Charge charge = Charge()
        ..amount = price * 100
        ..email = email
        //..accessCode = "kwchng"
        ..reference = _getReference()
        ..card = _getCardUI();

      CheckoutResponse response = await paystack.checkout(
        ctx,
        charge: charge,
        // method: CheckoutMethod.selectable,
        method: CheckoutMethod.card,
        fullscreen: false,
        logo: Image.asset(
          "assets/images/kwenchhonga-removebg2.png",
          width: 50.w,
          height: 50.w,
        ),
      );

      // ignore: avoid_print
      print("Response $response");

      if (response.status == true) {
        //Send data to the backend...
        SharedPreferences _pref = await SharedPreferences.getInstance();
        var token = _pref.getString("login");
        var _response = await http.post(
          Uri.parse("$baseUrl/api/transactions/"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
          body: json.encode({
            "user": email.toString(),
            "fullname": fullname.toString(),
            "plan": plan.toString(),
            "amount": price.toString(),
            "status": "success".toString(),
            "reference": response.reference.toString()
          }),
        );
        print("Transactions status : ${_response.statusCode}");
        if (_response.statusCode == 200 || _response.statusCode == 201) {
          // ignore: avoid_print
          print("Transaction Successful");
          //Navigate user to Transactions successful screen...
          Navigator.push(
            ctx,
            MaterialPageRoute(builder: (ctx) {
              return const transactionSuccessfulScreen();
            }),
          );
        } else {
          ScaffoldMessenger.of(ctx).showSnackBar(
            const SnackBar(
              content: Text("Transaction would be reverted due to network."),
            ),
          );
          //Navigate user to Transactions successful screen...
          Navigator.push(
            ctx,
            MaterialPageRoute(builder: (ctx) {
              return const transactionSuccessfulScreen();
            }),
          );
        }
      } else {
        // ignore: avoid_print
        print("Transaction Failed");
      }
    });
  }

  // send Data to the backend...
  // Map<String, dynamic> data = {
  //   "user": email,
  //   "fullname": fullname,
  //   "plan": plan,
  //   "amount": double.parse(price.toString()),
  //   "status": "success",
  //   "reference": response.reference
  // };

  // ignore: avoid_print
  // print(data);
  // void sendToBackend(Map<String, dynamic> data) async {
  //   var res = await apiService.postData("/api/transactions/", data);
  //   if (res.statusCode == 200 || res.statusCode == 201) {
  //     //Navigate user to Transactions successful screen...
  //     Navigator.push(
  //       ctx,
  //       MaterialPageRoute(builder: (ctx) {
  //         return const transactionSuccessfulScreen();
  //       }),
  //     );
  //   } else {
  //     throw Exception("Something went wrong...");
  //   }
  // }
}
