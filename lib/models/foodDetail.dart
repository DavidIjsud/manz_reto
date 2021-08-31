// To parse this JSON data, do
//
//     final foodDetail = foodDetailFromJson(jsonString);

import 'dart:convert';

FoodDetail foodDetailFromJson(String str) => FoodDetail.fromJson(json.decode(str));

String foodDetailToJson(FoodDetail data) => json.encode(data.toJson());

class FoodDetail {
    FoodDetail({
       required this.status,
       required this.message,
       required this.data,
    });

    bool status;
    String message;
    DetailInformation data;

    factory FoodDetail.fromJson(Map<String, dynamic> json) => FoodDetail(
        status: json["status"],
        message: json["message"],
        data: DetailInformation.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class DetailInformation {
    DetailInformation({
       required this.id,
       required this.nameFood,
       required this.recomended,
       required this.tags,
       required this.nutritions,
       required this.img,
       required this.salads,
       required this.ingredients
    });

    int id;
    String nameFood;
    bool recomended;
    List<String> tags;
    Nutritions nutritions;
    String img;
    List<Salad> salads;
    String ingredients;

    factory DetailInformation.fromJson(Map<String, dynamic> json) => DetailInformation(
        id: json["id"],
        nameFood: json["name_food"],
        recomended: json["recomended"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        nutritions: Nutritions.fromJson(json["nutritions"]),
        img: json["img"],
        salads: List<Salad>.from(json["salads"].map((x) => Salad.fromJson(x))),
        ingredients: json["ingredients"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_food": nameFood,
        "recomended": recomended,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "nutritions": nutritions.toJson(),
        "img": img,
        "salads": List<dynamic>.from(salads.map((x) => x.toJson())),
        "ingredients" : ingredients
    };
}

class Nutritions {
    Nutritions({
       required this.kcal,
       required this.grasa,
       required this.carbo,
       required this.prote,
    });

    int kcal;
    int grasa;
    int carbo;
    int prote;

    factory Nutritions.fromJson(Map<String, dynamic> json) => Nutritions(
        kcal: json["kcal"],
        grasa: json["grasa"],
        carbo: json["carbo"],
        prote: json["prote"],
    );

    Map<String, dynamic> toJson() => {
        "kcal": kcal,
        "grasa": grasa,
        "carbo": carbo,
        "prote": prote,
    };
}

class Salad {
    Salad({
       required this.id,
       required this.recomended,
       required this.img,
    });

    int id;
    bool recomended;
    String img;

    factory Salad.fromJson(Map<String, dynamic> json) => Salad(
        id: json["id"],
        recomended: json["recomended"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "recomended": recomended,
        "img": img,
    };
}
