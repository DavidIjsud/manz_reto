class Etiqueta {
    Etiqueta({
        required this.foto,
        required this.descrip,
    });

    String foto;
    String descrip;

    factory Etiqueta.fromJson(Map<String, dynamic> json) => Etiqueta(
        foto: json["foto"],
        descrip: json["descrip"],
    );

    Map<String, dynamic> toJson() => {
        "foto": foto,
        "descrip": descrip,
    };
}