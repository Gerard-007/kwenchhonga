// To parse this JSON data, do
//
//     final planModelClass = planModelClassFromMap(jsonString);

import 'dart:convert';

List<PlanModelClass> planModelClassFromMap(String str) =>
    List<PlanModelClass>.from(
        json.decode(str).map((x) => PlanModelClass.fromMap(x)));

String planModelClassToMap(List<PlanModelClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PlanModelClass {
  PlanModelClass({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.price,
    this.commission,
    this.tax,
    this.featured,
    this.active,
    this.timestamp,
  });

  int id;
  String title;
  String slug;
  String description;
  String price;
  String commission;
  String tax;
  bool featured;
  bool active;
  DateTime timestamp;

  factory PlanModelClass.fromMap(Map<String, dynamic> json) => PlanModelClass(
        id: json["id"] ?? "",
        title: json["title"] ?? "",
        slug: json["slug"] ?? "",
        description: json["description"] ?? "",
        price: json["price"] ?? "",
        commission: json["commission"] ?? "",
        tax: json["tax"] ?? "",
        featured: json["featured"] ?? "",
        active: json["active"] ?? "",
        timestamp: DateTime.parse(json["timestamp"]) ?? DateTime.now(),
      );

  Map<String, dynamic> toMap() => {
        "id": id ?? "",
        "title": title ?? "",
        "slug": slug ?? "",
        "description": description ?? "",
        "price": price ?? "",
        "commission": commission ?? "",
        "tax": tax ?? "",
        "featured": featured ?? "",
        "active": active ?? "",
        "timestamp": timestamp.toIso8601String(),
      };
}
