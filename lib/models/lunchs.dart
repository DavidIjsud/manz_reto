// To parse this JSON data, do
//
//     final lunchs = lunchsFromJson(jsonString);

import 'dart:convert';

Lunchs lunchsFromJson(String str) => Lunchs.fromJson(json.decode(str));

String lunchsToJson(Lunchs data) => json.encode(data.toJson());

class Lunchs {
    Lunchs({
       required this.status,
      required this.message,
       required this.data,
    });

    bool status;
    String message;
    Data data;

    factory Lunchs.fromJson(Map<String, dynamic> json) => Lunchs(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
       required this.day,
       required this.nro,
       required this.lunchs,
    });

    String day;
    int nro;
    List<Lunch> lunchs;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        day: json["day"],
        nro: json["nro"],
        lunchs: List<Lunch>.from(json["lunchs"].map((x) => Lunch.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "nro": nro,
        "lunchs": List<dynamic>.from(lunchs.map((x) => x.toJson())),
    };
}

class Lunch {
    Lunch({
       required this.img,
       required this.nameLunch,
       required this.recomended,
       required this.calories,
       required this.id,
    });

    String img;
    String nameLunch;
    bool recomended;
    int calories;
    int id;

    factory Lunch.fromJson(Map<String, dynamic> json) => Lunch(
        img: json["img"],
        nameLunch: json["name_lunch"],
        recomended: json["recomended"],
        calories: json["calories"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "img": img,
        "name_lunch": nameLunch,
        "recomended": recomended,
        "calories": calories,
        "id": id,
    };
}
