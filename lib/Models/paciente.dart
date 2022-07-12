class Paciente {
  String? id;
  String? nombre;
  String? direccion;
  String? correo;
  String? numero;
  String? contra;
  String? curp;
  String? alergias;
  String? padecimientos;
  String? sangre;
  String? serviciopublico;
  String? numref;
  String? contacto;
  String? numcontacto;
  String? domcontacto;
  String? fechanacimiento;
  Paciente(
      {required this.id,
      required this.nombre,
      required this.direccion,
      required this.correo,
      required this.numero,
      required this.contra,
      required this.curp,
      required this.alergias,
      required this.padecimientos,
      required this.sangre,
      required this.serviciopublico,
      required this.numref,
      required this.contacto,
      required this.numcontacto,
      this.domcontacto,
      this.fechanacimiento});
  Map<String, dynamic> toJson() => {
        'id': id,
        "nombre": nombre,
        "numero": numero,
        "domicilio": direccion,
        "correo": correo,
        "contra": contra,
        "curp": curp,
        "sangre": sangre,
        "padecimiento": padecimientos,
        "serviciopublico": serviciopublico,
        "numref": numref,
        "alergias": alergias,
        "contacto": contacto,
        "numcontacto": numcontacto,
        "domcontacto": domcontacto,
        "fechanacimiento": fechanacimiento
      };
}
