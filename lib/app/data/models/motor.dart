// To parse this JSON data, do
//
//     final motor = motorFromJson(jsonString);

import 'dart:convert';

Motor motorFromJson(String str) => Motor.fromJson(json.decode(str));

String motorToJson(Motor data) => json.encode(data.toJson());

class Motor {
    List<Datum> data;

    Motor({
        required this.data,
    });

    factory Motor.fromJson(Map<String, dynamic> json) => Motor(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String motorType;
    String motorName;
    String motorPlat;
    int pricePerDay;
    String fileName;

    Datum({
        required this.id,
        required this.motorType,
        required this.motorName,
        required this.motorPlat,
        required this.pricePerDay,
        required this.fileName,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        motorType: json["motor_type"],
        motorName: json["motor_name"],
        motorPlat: json["motor_plat"],
        pricePerDay: json["price_per_day"],
        fileName: json["file_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "motor_type": motorType,
        "motor_name": motorName,
        "motor_plat": motorPlat,
        "price_per_day": pricePerDay,
        "file_name": fileName,
    };
}
