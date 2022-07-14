class Servicio {
  String? id;
  String? destino;
  String? origen;
  String? fecha;
  String? tipo;
  String? oxigeno;

  Servicio(
      {required this.destino,
      this.origen,
      required this.tipo,
      required this.fecha,
      this.oxigeno});

  Map<String, dynamic> regularJson() => {
        "id": id,
        "destino": destino,
        "fecha": fecha,
        "tipo": tipo,
      };
  Map<String, dynamic> ambulanciaJson() => {
        "id": id,
        "destino": destino,
        "origen": origen,
        "fecha": fecha,
        "tipo": tipo,
        "oxigeno": oxigeno
      };
}
