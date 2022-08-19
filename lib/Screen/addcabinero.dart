import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/Models/servicio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AgregarCabinero extends StatefulWidget {
  const AgregarCabinero({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  State<AgregarCabinero> createState() => _AgregarCabineroState();
}

class _AgregarCabineroState extends State<AgregarCabinero> {
  String date = "";
  DateTime selectedDate = DateTime.now();

  final formkey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  final nombre = TextEditingController();
  final correo = TextEditingController();
  final contra = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo Cabinero"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              //Destino
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30)
                    .copyWith(top: 10, bottom: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Poner Nombre NO VACIO";
                    } else {
                      return null;
                    }
                  },
                  controller: nombre,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.red, fontSize: 14.5),
                  decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      prefixIconConstraints: const BoxConstraints(minWidth: 45),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.red,
                        size: 22,
                      ),
                      border: InputBorder.none,
                      hintText: 'Nombre Completo',
                      hintStyle:
                          const TextStyle(color: Colors.red, fontSize: 14.5),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100)
                              .copyWith(bottomRight: const Radius.circular(0)),
                          borderSide: const BorderSide(color: Colors.white38)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100)
                              .copyWith(bottomRight: const Radius.circular(0)),
                          borderSide: const BorderSide(color: Colors.red))),
                ),
              ),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30)
                    .copyWith(top: 10, bottom: 10),
                child: TextFormField(
                  validator: (value) {
                     if (value!.isEmpty ||
                        !RegExp(r'^([a-zA-Z0-9])+([\.a-zA-Z0-9_-])*@([a-zA-Z0-9])+(\.[a-zA-Z0-9_-]+)+$')
                            .hasMatch(value)) {
                      return "Poner CORREO correcto";
                    } else {
                      return null;
                    }
                  },
                  controller: correo,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.red, fontSize: 14.5),
                  decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      prefixIconConstraints: const BoxConstraints(minWidth: 45),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.red,
                        size: 22,
                      ),
                      border: InputBorder.none,
                      hintText: 'correo@ejemplo.com',
                      hintStyle:
                          const TextStyle(color: Colors.red, fontSize: 14.5),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100)
                              .copyWith(bottomRight: const Radius.circular(0)),
                          borderSide: const BorderSide(color: Colors.white38)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100)
                              .copyWith(bottomRight: const Radius.circular(0)),
                          borderSide: const BorderSide(color: Colors.red))),
                ),
              ),
              //Fecha
              const SizedBox(
                height: 40,
              ),
              //Boton Registro
              GestureDetector(
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    final String dest = nombre.text.trim();
                    final String date = DateFormat.yMd().format(selectedDate);
                    final _servicioDoc =
                        FirebaseFirestore.instance.collection('servicio').doc();
                    final servicio = Servicio(
                        id: _servicioDoc.id,
                        destino: dest,
                        tipo: widget.title,
                        fecha: date);
                    await _servicioDoc
                        .set(servicio.regularJson())
                        .whenComplete(() {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Se ha registrado su agenda')));
                      nombre.text = "";
                      contra.text = "";
                    });
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
                  child: Text('Agendar Servicio',
                      style: TextStyle(
                          color: Colors.white.withOpacity(.8),
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
