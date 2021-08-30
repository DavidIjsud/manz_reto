// To parse this JSON data, do
//
//     final infoOfDay = infoOfDayFromJson(jsonString);

import 'dart:convert';

List<InfoOfDay> infoOfDayFromJson(String str) => List<InfoOfDay>.from(json.decode(str).map((x) => InfoOfDay.fromJson(x)));

String infoOfDayToJson(List<InfoOfDay> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InfoOfDay {
    InfoOfDay({
       required this.name,
       required this.porcent,
       required this.image,
       required this.foods,
       required this.credits,
    });

    String name;
    int porcent;
    String image;
    List<Food> foods;
    bool credits;

    factory InfoOfDay.fromJson(Map<String, dynamic> json) => InfoOfDay(
        name: json["name"],
        porcent: json["porcent"],
        image: json["image"],
        foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
        credits: json["credits"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "porcent": porcent,
        "image": image,
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "credits": credits,
    };
}

class Food {
    Food({
       required this.nameFood,
       required this.procentFood,
        required this.img,
        required this.id
    });

    String nameFood;
    int procentFood;
    String img;
    int id;

    factory Food.fromJson(Map<String, dynamic> json) => Food(
        nameFood: json["name_food"],
        procentFood: json["procent_food"],
        img: json["img"],
        id : json["id"]
    );

    Map<String, dynamic> toJson() => {
        "name_food": nameFood,
        "procent_food": procentFood,
        "img": img,
        "id" : id
    };
}
