// To parse this JSON data, do
//
//     final motor = motorFromJson(jsonString);

import 'dart:convert';

List<Motor> motorFromJson(String str) => List<Motor>.from(json.decode(str).map((x) => Motor.fromJson(x)));

String motorToJson(List<Motor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Motor {
    int id;
    String avaiable;
    String booked;
    String onrent;
    String sum;
    dynamic createdAt;
    dynamic updatedAt;

    Motor({
        required this.id,
        required this.avaiable,
        required this.booked,
        required this.onrent,
        required this.sum,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Motor.fromJson(Map<String, dynamic> json) => Motor(
        id: json["id"],
        avaiable: json["avaiable"],
        booked: json["booked"],
        onrent: json["onrent"],
        sum: json["sum"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "avaiable": avaiable,
        "booked": booked,
        "onrent": onrent,
        "sum": sum,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
