class Admin {
  String? id;
  String? nombre;
  String? correo;
  String? contra;
  String? tipo;

  Admin({this.id, this.nombre, this.correo, this.contra, this.tipo});

  Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': nombre,
        'correo': correo,
        'contra': contra,
        'tipo': tipo
      };

  static Admin fromJson(Map<String, dynamic> json) => Admin(
      id: json['id'],
      nombre: json['nombre'],
      correo: json['correo'],
      contra: json['contra'],
      tipo: json['tipo']);
}
