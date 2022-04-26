// To parse this JSON data, do
//
//     final userModelClass = userModelClassFromMap(jsonString);

import 'dart:convert';

UserModelClass userModelClassFromMap(String str) =>
    UserModelClass.fromMap(json.decode(str));

String userModelClassToMap(UserModelClass data) => json.encode(data.toMap());

class UserModelClass {
  UserModelClass({
    this.user,
  });

  User user;

  factory UserModelClass.fromMap(Map<String, dynamic> json) => UserModelClass(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "user": user == null ? "" : user.toMap(),
      };
}

class User {
  User({
    this.username,
    this.email,
    this.phone,
    this.myBalance,
    this.profile,
  });

  String username;
  String email;
  String phone;
  double myBalance;
  Profile profile;

  factory User.fromMap(Map<String, dynamic> json) => User(
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        myBalance: double.parse(json["my_balance"]) ?? 0.00,
        profile:
            json["profile"] == null ? null : Profile.fromMap(json["profile"]),
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "email": email,
        "phone": phone,
        "my_balance": myBalance ?? 0.00,
        "profile": profile == null ? null : profile.toMap(),
      };
}

class Profile {
  Profile({
    this.id,
    this.fname,
    this.lname,
    this.fullName,
    this.gender,
    this.avatar,
    this.avatarUrl,
    this.pastPlanName,
    this.pastPlanPrice,
    this.pastPlanDate,
    this.plansCount,
    this.transactionsCount,
    this.successfulPastPayment,
    this.pendingBalance,
  });

  int id;
  String fname;
  String lname;
  String fullName;
  String gender;
  dynamic avatar;
  String avatarUrl;
  String pastPlanName;
  double pastPlanPrice;
  DateTime pastPlanDate;
  int plansCount;
  int transactionsCount;
  double successfulPastPayment;
  double pendingBalance;

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
        id: json["id"] ?? "",
        fname: json["fname"] ?? "",
        lname: json["lname"] ?? "",
        fullName: json["full_name"] ?? "",
        gender: json["gender"] ?? "",
        avatar: json["avatar"],
        avatarUrl: json["avatar_url"] ?? "",
        pastPlanName: json["past_plan_name"] ?? "",
        pastPlanPrice: double.parse(json["past_plan_price"]) ?? 0.00,
        pastPlanDate: DateTime.parse(json["past_plan_date"]) ?? DateTime.now(),
        plansCount: int.parse(json["plans_count"]) ?? 0,
        transactionsCount: int.parse(json["transactions_count"]) ?? 0,
        successfulPastPayment:
            double.parse(json["successful_past_payment"]) ?? 0.00,
        pendingBalance: double.parse(json["pending_balance"]) ?? 0.00,
      );

  Map<String, dynamic> toMap() => {
        "id": id ?? "",
        "fname": fname,
        "lname": lname,
        "full_name": fullName ?? "",
        "gender": gender ?? "",
        "avatar": avatar,
        "avatar_url": avatarUrl ?? "",
        "past_plan_name": pastPlanName ?? "",
        "past_plan_price": pastPlanPrice ?? 0.00,
        "past_plan_date": pastPlanDate.toIso8601String(),
        "plans_count": plansCount ?? 0,
        "transactions_count": transactionsCount ?? 0,
        "successful_past_payment": successfulPastPayment ?? 0.00,
        "pending_balance": pendingBalance ?? 0.00,
      };
}
