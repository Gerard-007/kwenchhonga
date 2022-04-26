import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kwenchhonga/api/api_service.dart';
import 'package:kwenchhonga/screens/transaction_success.dart';
import 'package:kwenchhonga/utils/constants.dart';

class MakePayment {
  MakePayment(
      {this.ctx,
      this.price,
      this.email,
      this.plan,
      this.planCommission,
      this.planTax,
      this.fullname});

  BuildContext ctx;
  int price;
  String email;
  String fullname;
  String plan;
  String planCommission;
  String planTax;

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
        Map<String, dynamic> data = {
          "user": email,
          "fullname": "",
          "plan": plan,
          "plan_commission": planCommission,
          "plan_tax": planTax,
          "amount": double.parse(price.toString()),
          "status": response.status,
          "description": "",
          "reference": response.reference
        };

        // ignore: avoid_print
        print(data);

        // send Data to the backend...
        apiService.postData("/api/transactions/", data);

        //Navigate user to Transactions successful screen...
        Navigator.push(
          ctx,
          MaterialPageRoute(builder: (ctx) {
            return const transactionSuccessfulScreen();
          }),
        );

        // ignore: avoid_print
        print("Transaction Successful");
      } else {
        // ignore: avoid_print
        print("Transaction Failed");
      }
    });
  }
}
