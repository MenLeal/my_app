import 'package:my_app/Models/paciente.dart';

class Servicio {
  String? id;
  String? destino;
  String? origen;
  String? fecha;
  String? tipo;
  String? oxigeno;

  Servicio(
      {this.id,
      required this.destino,
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

  static Servicio fromJsonReg(Map<String, dynamic> json) => Servicio(
      id: json['id'],
      destino: json['destino'],
      tipo: json['tipo'],
      fecha: json['fecha']);
}
