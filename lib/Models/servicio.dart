class Servicio {
  String? id;
  String? uid;
  String? destino;
  String? origen;
  String? fecha;
  String? tipo;
  String? oxigeno;
  String? estado;

  Servicio({
    this.id,
    this.uid,
    required this.destino,
    this.origen,
    required this.tipo,
    required this.fecha,
    this.oxigeno,
    this.estado,
  });

  Map<String, dynamic> regularJson() => {
        "id": id,
        "uid": uid,
        "destino": destino,
        "fecha": fecha,
        "tipo": tipo,
        "estado": estado,
      };
  Map<String, dynamic> ambulanciaJson() => {
        "id": id,
        "uid": uid,
        "destino": destino,
        "origen": origen,
        "fecha": fecha,
        "tipo": tipo,
        "oxigeno": oxigeno,
        "estado": estado
      };

  static Servicio fromJsonReg(Map<String, dynamic> json) => Servicio(
        id: json['id'],
        uid: json['uid'],
        destino: json['destino'],
        origen: json['origen'],
        tipo: json['tipo'],
        fecha: json['fecha'],
        estado: json['estado'],
      );

  static Servicio fromJsonAmb(Map<String, dynamic> json) => Servicio(
        id: json['id'],
        uid: json['uid'],
        destino: json['destino'],
        tipo: json['tipo'],
        fecha: json['fecha'],
        oxigeno: json['oxigeno'],
        estado: json['estado'],
        origen: json['origen'],
      );
}
