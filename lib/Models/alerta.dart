class Alerta {
  String? id;
  String? uid;
  String? fechahora;
  String? latitud;
  String? longitud;
  String? estado;
  String? motivo;
  String? fechahoramotivo;
  String? token;

  Alerta(
      {this.id,
      this.uid,
      this.fechahora,
      this.latitud,
      this.longitud,
      this.estado,
      this.motivo,
      this.fechahoramotivo,
      this.token});

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "fechahora": fechahora,
        "latitud": latitud,
        "longitud": longitud,
        "estado": estado,
        "motivo": motivo,
        "fechahoramotivo": fechahoramotivo,
        "token": token,
      };

  static Alerta fromJson(Map<String, dynamic> json) => Alerta(
        id: json['id'],
        uid: json['uid'],
        fechahora: json['fechahora'],
        latitud: json['latitud'],
        longitud: json['longitud'],
        estado: json['estado'],
        motivo: json['motivo'],
        fechahoramotivo: json['fechahoramotivo'], 
        token: json['token'],
      );
}
