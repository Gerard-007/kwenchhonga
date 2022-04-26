class ProfileModelClass {
  int id;
  String fname;
  String lname;
  String fullName;
  String gender;
  String avatar;
  String avatarUrl;
  String pastPlanName;
  String pastPlanPrice;
  String pastPlanDate;
  String plansCount;
  String transactionsCount;
  String successfulPastPayment;
  String pendingBalance;

  ProfileModelClass(
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

  ProfileModelClass.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    fname = json['fname'] ?? "";
    lname = json['lname'] ?? "";
    fullName = json['full_name'] ?? "";
    gender = json['gender'] ?? "";
    avatar = json['avatar'] ?? "";
    avatarUrl = json['avatar_url'] ?? "";
    pastPlanName = json['past_plan_name'] ?? "";
    pastPlanPrice = json['past_plan_price'] ?? "";
    pastPlanDate = json['past_plan_date'] ?? "";
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
    data['past_plan_date'] = pastPlanDate ?? "";
    data['plans_count'] = plansCount ?? "";
    data['transactions_count'] = transactionsCount ?? "";
    data['successful_past_payment'] = successfulPastPayment ?? "";
    data['pending_balance'] = pendingBalance ?? "";
    return data;
  }
}
