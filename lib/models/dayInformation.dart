import 'package:manzana_verde_reto/models/day.dart';

class DayInformation {
    DayInformation({
        required this.day,
        required this.numb,
        required this.ordered,
        required this.comida,
    });

    String day;
    int numb;
    bool ordered;
    Comida? comida;

    factory DayInformation.fromJson(Map<String, dynamic> json) => DayInformation(
        day: json["day"],
        numb: json["numb"],
        ordered: json["ordered"],
        comida: json["comida"] == null ? null : Comida.fromJson(json["comida"]),
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "numb": numb,
        "ordered": ordered,
        "comida": comida == null ? null : comida?.toJson(),
    };
}