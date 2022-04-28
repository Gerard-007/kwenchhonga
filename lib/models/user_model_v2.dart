class CurrentUserModelClass {
  User user;

  CurrentUserModelClass({this.user});

  CurrentUserModelClass.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user.toJson();
    }
    return data;
  }
}

class User {
  String username;
  String email;
  String phone;
  String myBalance;
  Profile profile;

  User({this.username, this.email, this.phone, this.myBalance, this.profile});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'] ?? "";
    email = json['email'] ?? "";
    phone = json['phone'] ?? "";
    myBalance = json['my_balance'] ?? "";
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = username ?? "";
    data['email'] = email ?? "";
    data['phone'] = phone ?? "";
    data['my_balance'] = myBalance ?? "";
    if (profile != null) {
      data['profile'] = profile.toJson();
    }
    return data;
  }
}

class Profile {
  int id;
  String fname;
  String lname;
  String fullName;
  String gender;
  String avatar;
  String avatarUrl;
  String pastPlanName;
  String pastPlanPrice;
  DateTime pastPlanDate;
  String plansCount;
  String transactionsCount;
  String successfulPastPayment;
  String pendingBalance;

  Profile(
      {this.id,
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
      this.pendingBalance});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    fname = json['fname'] ?? "";
    lname = json['lname'] ?? "";
    fullName = json['full_name'] ?? "";
    gender = json['gender'] ?? "";
    avatar = json['avatar'] ?? "";
    avatarUrl = json['avatar_url'] ?? "";
    pastPlanName = json['past_plan_name'] ?? "";
    pastPlanPrice = json['past_plan_price'] ?? "";
    pastPlanDate = DateTime.parse(json['past_plan_date']) ?? DateTime.now();
    plansCount = json['plans_count'] ?? "";
    transactionsCount = json['transactions_count'] ?? "";
    successfulPastPayment = json['successful_past_payment'] ?? "";
    pendingBalance = json['pending_balance'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? "";
    data['fname'] = fname ?? "";
    data['lname'] = lname ?? "";
    data['full_name'] = fullName ?? "";
    data['gender'] = gender ?? "";
    data['avatar'] = avatar ?? "";
    data['avatar_url'] = avatarUrl ?? "";
    data['past_plan_name'] = pastPlanName ?? "";
    data['past_plan_price'] = pastPlanPrice ?? "";
    data['past_plan_date'] = pastPlanDate.toIso8601String();
    data['plans_count'] = plansCount ?? "";
    data['transactions_count'] = transactionsCount ?? "";
    data['successful_past_payment'] = successfulPastPayment ?? "";
    data['pending_balance'] = pendingBalance ?? "";
    return data;
  }
}
