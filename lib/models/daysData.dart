import 'dart:convert';

import 'package:manzana_verde_reto/models/dayInformation.dart';

DaysData daysDataFromJson(String str) => DaysData.fromJson(json.decode(str));

String daysDataToJson(DaysData data) => json.encode(data.toJson());

class DaysData {
    DaysData({
        required this.status,
        required this.message,
        required this.data,
    });

    bool status;
    String message;
    List<DayInformation> data;

    factory DaysData.fromJson(Map<String, dynamic> json) => DaysData(
        status: json["status"],
        message: json["message"],
        data: List<DayInformation>.from(json["data"].map((x) => DayInformation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}






