// To parse this JSON data, do
//
//     final transactionModelClass = transactionModelClassFromMap(jsonString);

import 'dart:convert';

List<TransactionModelClass> transactionModelClassFromMap(String str) =>
    List<TransactionModelClass>.from(
        json.decode(str).map((x) => TransactionModelClass.fromMap(x)));

String transactionModelClassToMap(List<TransactionModelClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class TransactionModelClass {
  TransactionModelClass({
    this.id,
    this.type,
    this.plan,
    this.planName,
    this.transactionAmount,
    this.planCommission,
    this.planTax,
    this.status,
    this.description,
    this.reference,
    this.token,
    this.timestamp,
    this.approved,
  });

  int id;
  String type;
  int plan;
  String planName;
  String transactionAmount;
  String planCommission;
  String planTax;
  String status;
  String description;
  String reference;
  String token;
  DateTime timestamp;
  bool approved;

  factory TransactionModelClass.fromMap(Map<String, dynamic> json) =>
      TransactionModelClass(
        id: json["id"] ?? "",
        type: json["type"] ?? "",
        plan: json["plan"] ?? "",
        planName: json["plan_name"] ?? "",
        transactionAmount: json["transaction_amount"] ?? "",
        planCommission: json["plan_commission"] ?? "",
        planTax: json["plan_tax"] ?? "",
        status: json["status"] ?? "",
        description: json["description"] ?? "",
        reference: json["reference"] ?? "",
        token: json["token"] ?? "",
        timestamp: DateTime.parse(json["timestamp"]) ?? DateTime.now(),
        approved: json["approved"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id ?? "",
        "type": type ?? "",
        "plan": plan ?? "",
        "plan_name": planName ?? "",
        "transaction_amount": transactionAmount ?? "",
        "plan_commission": planCommission ?? "",
        "plan_tax": planTax ?? "",
        "status": status ?? "",
        "description": description ?? "",
        "reference": reference ?? "",
        "token": token ?? "",
        "timestamp": timestamp.toIso8601String(),
        "approved": approved ?? "",
      };
}
