// To parse this JSON data, do
//
//     final notificationModelClass = notificationModelClassFromMap(jsonString);

import 'dart:convert';

List<NotificationModelClass> notificationModelClassFromMap(String str) =>
    List<NotificationModelClass>.from(
        json.decode(str).map((x) => NotificationModelClass.fromMap(x)));

String notificationModelClassToMap(List<NotificationModelClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class NotificationModelClass {
  NotificationModelClass({
    this.id,
    this.getType,
    this.type,
    this.fromSystem,
    this.message,
    this.date,
    this.isSeen,
  });

  int id;
  String getType;
  String type;
  String fromSystem;
  String message;
  DateTime date;
  bool isSeen;

  factory NotificationModelClass.fromMap(Map<String, dynamic> json) =>
      NotificationModelClass(
        id: json["id"] ?? "",
        getType: json["get_type"] ?? "",
        type: json["type"] ?? "",
        fromSystem: json["from_system"] ?? "",
        message: json["message"] ?? "",
        date: DateTime.parse(json["date"]) ?? "",
        isSeen: json["is_seen"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id ?? "",
        "get_type": getType ?? "",
        "type": type ?? "",
        "from_system": fromSystem ?? "",
        "message": message ?? "",
        "date": date.toIso8601String(),
        "is_seen": isSeen ?? "",
      };
}
