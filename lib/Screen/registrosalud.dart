import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Models/paciente.dart';
import '/Screen/iniciosesion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SaludDatos extends StatefulWidget {
  const SaludDatos(
      {Key? key,
      required this.nombre,
      required this.direccion,
      required this.correo,
      required this.contra,
      required this.numero})
      : super(key: key);

  final String? nombre;
  final String? direccion;
  final String? correo;
  final String? contra;
  final String? numero;

  @override
  State<SaludDatos> createState() => _SaludDatosState();
}

class _SaludDatosState extends State<SaludDatos> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  DateTime selectedDate = DateTime.now();
  String date = "";

  final formkey = GlobalKey<FormState>();

  final CollectionReference _usuarios =
      FirebaseFirestore.instance.collection('pacientes');

  final alergiasController = TextEditingController();
  final direccionController = TextEditingController();
  final nombreccontroller = TextEditingController();
  final contraController = TextEditingController();
  final contracController = TextEditingController();
  final ssnumeroController = TextEditingController();
  final numerocontactoController = TextEditingController();
  final numerossController = TextEditingController();
  final curpController = TextEditingController();

  String? sangre = "A+";
  List<String> listSangre = ["A+", "A-", "O+", "O-", "AB+", "AB-", "B+", "B-"];

  String? numss = "Ninguno";
  List<String> listServSalud = [
    "IMSS",
    "ISSTE",
    "Seguro Militar",
    "INSABI",
    "Ninguno"
  ];

  String? padecimiento = "Ninguno";
  List<String> listPadecimiento = [
    "Ninguno",
    "Diabetes",
    "Hipertensión",
    "Asma",
    "Cardiopatías",
    "Hepatitis",
    "VIH"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //Fondo
        body: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 243, 122, 122),
            Color.fromARGB(255, 163, 11, 11)
          ])),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  //Imagen
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 200,
                      width: 300,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 15, bottom: 25, left: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/cruzroja.png",
                              width: 102,
                              alignment: Alignment.center,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Datos Personales ',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                        color: Colors.black45,
                                        offset: Offset(1, 1),
                                        blurRadius: 5)
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //CURP
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30)
                        .copyWith(bottom: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            value.length < 18 ||
                            value.length > 18) {
                          return "Poner CURP VÁLIDO de 18 DÍGITOS";
                        } else {
                          return null;
                        }
                      },
                      controller: curpController,
                      keyboardType: TextInputType.text,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14.5),
                      decoration: InputDecoration(
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 45),
                          prefixIcon: const Icon(
                            Icons.medication,
                            color: Colors.white70,
                            size: 22,
                          ),
                          border: InputBorder.none,
                          errorStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          hintText: 'CURP',
                          hintStyle: const TextStyle(
                              color: Colors.white60, fontSize: 14.5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100).copyWith(
                                  bottomRight: const Radius.circular(0)),
                              borderSide:
                                  const BorderSide(color: Colors.white38)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100).copyWith(
                                  bottomRight: const Radius.circular(0)),
                              borderSide:
                                  const BorderSide(color: Colors.white70))),
                    ),
                  ),
                  //Alergias
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30)
                        .copyWith(bottom: 10),
                    child: TextFormField(
                      controller: alergiasController,
                      keyboardType: TextInputType.text,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14.5),
                      decoration: InputDecoration(
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 45),
                          prefixIcon: const Icon(
                            Icons.medication,
                            color: Colors.white70,
                            size: 22,
                          ),
                          border: InputBorder.none,
                          errorStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          hintText: 'Alérgia a medicamentos ej. Penicilina',
                          hintStyle: const TextStyle(
                              color: Colors.white60, fontSize: 14.5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100).copyWith(
                                  bottomRight: const Radius.circular(0)),
                              borderSide:
                                  const BorderSide(color: Colors.white38)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100).copyWith(
                                  bottomRight: const Radius.circular(0)),
                              borderSide:
                                  const BorderSide(color: Colors.white70))),
                    ),
                  ),
                  //Padecimientos
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30)
                        .copyWith(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Padecimientos  ",
                          style: TextStyle(color: Colors.white, fontSize: 14.5),
                        ),
                        DropdownButton<String>(
                            icon: const Icon(
                              Icons.sick,
                              color: Colors.white,
                            ),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14.5),
                            dropdownColor: Colors.red,
                            value: padecimiento,
                            items: listPadecimiento
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    ))
                                .toList(),
                            onChanged: (item) =>
                                setState(() => padecimiento = item)),
                      ],
                    ),
                  ),
                  const Text(
                    'Servicio Médico Público ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              color: Colors.black45,
                              offset: Offset(1, 1),
                              blurRadius: 5)
                        ]),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //Servicio Publico
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30)
                        .copyWith(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Dependencia de Gobierno ",
                          style: TextStyle(color: Colors.white, fontSize: 14.5),
                        ),
                        DropdownButton<String>(
                            icon: const Icon(
                              Icons.local_hospital,
                              color: Colors.white,
                            ),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14.5),
                            dropdownColor: Colors.red,
                            value: numss,
                            items: listServSalud
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    ))
                                .toList(),
                            onChanged: (item) => setState(() => numss = item)),
                      ],
                    ),
                  ),
                  //Numero de ref
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30)
                        .copyWith(bottom: 10),
                    child: TextFormField(
                      controller: numerossController,
                      keyboardType: TextInputType.name,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14.5),
                      decoration: InputDecoration(
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 45),
                          prefixIcon: const Icon(
                            Icons.medication,
                            color: Colors.white70,
                            size: 22,
                          ),
                          border: InputBorder.none,
                          errorStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          hintText: 'Número de afiliación',
                          hintStyle: const TextStyle(
                              color: Colors.white60, fontSize: 14.5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100).copyWith(
                                  bottomRight: const Radius.circular(0)),
                              borderSide:
                                  const BorderSide(color: Colors.white38)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100).copyWith(
                                  bottomRight: const Radius.circular(0)),
                              borderSide:
                                  const BorderSide(color: Colors.white70))),
                    ),
                  ),
                  //Tipo de sangre
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30)
                        .copyWith(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Tipo de Sangre    ",
                          style: TextStyle(color: Colors.white, fontSize: 14.5),
                        ),
                        DropdownButton<String>(
                            icon: const Icon(
                              Icons.bloodtype,
                              color: Colors.white,
                            ),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14.5),
                            dropdownColor: Colors.red,
                            value: sangre,
                            items: listSangre
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    ))
                                .toList(),
                            onChanged: (item) => setState(() => sangre = item)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Contacto de Emergencia ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              color: Colors.black45,
                              offset: Offset(1, 1),
                              blurRadius: 5)
                        ]),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //Celular Contacto Emergencia
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30)
                        .copyWith(bottom: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            value.length < 10 ||
                            value.length > 10) {
                          return "Poner CELULAR VÁLIDO de 10 DÍGITOS";
                        } else {
                          return null;
                        }
                      },
                      controller: numerocontactoController,
                      keyboardType: TextInputType.phone,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14.5),
                      decoration: InputDecoration(
                          errorStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 45),
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Colors.white70,
                            size: 22,
                          ),
                          border: InputBorder.none,
                          hintText: '555-555-55-55',
                          hintStyle: const TextStyle(
                              color: Colors.white60, fontSize: 14.5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100).copyWith(
                                  bottomRight: const Radius.circular(0)),
                              borderSide:
                                  const BorderSide(color: Colors.white38)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100).copyWith(
                                  bottomRight: const Radius.circular(0)),
                              borderSide:
                                  const BorderSide(color: Colors.white70))),
                    ),
                  ),
                  //Nombre Contacto Emergencia
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30)
                        .copyWith(bottom: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Poner NOMBRE correcto";
                        } else {
                          return null;
                        }
                      },
                      controller: nombreccontroller,
                      keyboardType: TextInputType.name,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14.5),
                      decoration: InputDecoration(
                          errorStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 45),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.white70,
                            size: 22,
                          ),
                          border: InputBorder.none,
                          hintText: 'Nombre Completo',
                          hintStyle: const TextStyle(
                              color: Colors.white60, fontSize: 14.5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100).copyWith(
                                  bottomRight: const Radius.circular(0)),
                              borderSide:
                                  const BorderSide(color: Colors.white38)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100).copyWith(
                                  bottomRight: const Radius.circular(0)),
                              borderSide:
                                  const BorderSide(color: Colors.white70))),
                    ),
                  ),
                  //Domicilio Contacto Emergencia
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30)
                        .copyWith(bottom: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Poner un DOMICILIO VÁLIDO";
                        } else {
                          return null;
                        }
                      },
                      controller: direccionController,
                      keyboardType: TextInputType.streetAddress,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14.5),
                      decoration: InputDecoration(
                          errorStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 45),
                          prefixIcon: const Icon(
                            Icons.home,
                            color: Colors.white70,
                            size: 22,
                          ),
                          border: InputBorder.none,
                          hintText: 'calle # entre # y # num # Colonia AAA',
                          hintStyle: const TextStyle(
                              color: Colors.white60, fontSize: 14.5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100).copyWith(
                                  bottomRight: const Radius.circular(0)),
                              borderSide:
                                  const BorderSide(color: Colors.white38)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100).copyWith(
                                  bottomRight: const Radius.circular(0)),
                              borderSide:
                                  const BorderSide(color: Colors.white70))),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  //Boton Registro
                  GestureDetector(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        final String alergias = alergiasController.text.trim();
                        final String contacto = nombreccontroller.text.trim();
                        final String numcontacto =
                            numerocontactoController.text.trim();
                        final String numeroref = numerossController.text.trim();
                        final String domiciliocontacto =
                            direccionController.text.trim();
                        final String curpc = curpController.text.trim();
                        final String curp = curpc.toUpperCase();
                        final String fecha = curp.substring(4, 10);
                        if (numcontacto.length.isFinite &&
                            numcontacto.length == 10) {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: widget.correo.toString(),
                                  password: widget.contra.toString())
                              .whenComplete(() async {
                            final uid = FirebaseAuth.instance.currentUser!.uid;
                            final paciente = Paciente(
                                id: uid,
                                nombre: widget.nombre,
                                direccion: widget.direccion,
                                correo: widget.correo,
                                numero: widget.numero,
                                contra: widget.contra,
                                curp: curp,
                                alergias: alergias,
                                padecimientos: padecimiento,
                                sangre: sangre,
                                serviciopublico: numss,
                                numref: numeroref,
                                contacto: contacto,
                                numcontacto: numcontacto,
                                domcontacto: domiciliocontacto,
                                fechanacimiento: fecha);
                            await _usuarios.doc(uid).set(paciente.toJson());
                            curpController.text = "";
                            alergiasController.text = "";
                            numerossController.text = "";
                            numerocontactoController.text = "";
                            direccionController.text = "";
                            nombreccontroller.text = "";
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Se ha añadido el usuario correctamente')));
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const InicioPag(),
                              ),
                            );
                          });
                        }
                      }
                    },
                    child: Container(
                      height: 53,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color: Colors.black12.withOpacity(.2),
                                offset: const Offset(2, 2))
                          ],
                          borderRadius: BorderRadius.circular(100)
                              .copyWith(bottomRight: const Radius.circular(0)),
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 243, 94, 94),
                            Color.fromARGB(255, 136, 14, 14)
                          ])),
                      child: Text('Registrarse',
                          style: TextStyle(
                              color: Colors.white.withOpacity(.8),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('¿Ya tiene una cuenta?',
                      style: TextStyle(color: Colors.white70, fontSize: 13)),
                  const SizedBox(
                    height: 20,
                  ),
                  //Boton hacia Inicio de Sesion
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const InicioPag(),
                        ),
                      );
                    },
                    child: Container(
                      height: 53,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white60),
                        borderRadius: BorderRadius.circular(100)
                            .copyWith(bottomRight: const Radius.circular(0)),
                      ),
                      child: Text('Iniciar Sesion',
                          style: TextStyle(
                              color: Colors.white.withOpacity(.8),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
