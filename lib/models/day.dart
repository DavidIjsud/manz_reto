import 'package:manzana_verde_reto/models/etiqueta.dart';

class Comida {
    Comida({
        required this.id,
        required this.name,
        required this.recomended,
        required this.ingredientes,
        required this.kcal,
        required this.grasa,
        required this.carbo,
        required this.prote,
        required this.etiquetas,
    });

    int id;
    String name;
    bool recomended;
    String ingredientes;
    int kcal;
    int grasa;
    int carbo;
    int prote;
    List<Etiqueta> etiquetas;

    factory Comida.fromJson(Map<String, dynamic> json) => Comida(
        id: json["id"],
        name: json["name"],
        recomended: json["recomended"],
        ingredientes: json["ingredientes"],
        kcal: json["kcal"],
        grasa: json["grasa"],
        carbo: json["carbo"],
        prote: json["prote"],
        etiquetas: List<Etiqueta>.from(json["etiquetas"].map((x) => Etiqueta.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "recomended": recomended,
        "ingredientes": ingredientes,
        "kcal": kcal,
        "grasa": grasa,
        "carbo": carbo,
        "prote": prote,
        "etiquetas": List<dynamic>.from(etiquetas.map((x) => x.toJson())),
    };
}