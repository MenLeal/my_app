import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/Screen/iniciosesion.dart';

class EditarUser extends StatefulWidget {
  const EditarUser({Key? key}) : super(key: key);

  @override
  State<EditarUser> createState() => _EditarUserState();
}

class _EditarUserState extends State<EditarUser> {
  String? uid;

  final formkey = GlobalKey<FormState>();

  final nombreController = TextEditingController();
  final direccionController = TextEditingController();
  final correoController = TextEditingController();
  final contraController = TextEditingController();
  final contracController = TextEditingController();
  final numeroController = TextEditingController();

  Future signOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    await FirebaseAuth.instance.signOut().whenComplete(() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const InicioPag()),
      );
    });
  }

  void getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('page', 2);
    setState(() {
      nombreController.text = prefs.getString("nombre").toString();
      numeroController.text = prefs.getString("numero").toString();
      correoController.text = prefs.getString("correo").toString();
      direccionController.text = prefs.getString("direccion").toString();
      uid = prefs.getString("uid");
    });
  }
  void setPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('page', 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    setPrefs();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Datos del Usuario"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              //Nombres
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30)
                    .copyWith(bottom: 10, top: 20),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Poner un DOMICILIO VÁLIDO";
                    } else {
                      return null;
                    }
                  },
                  controller: nombreController,
                  keyboardType: TextInputType.streetAddress,
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
              //Numero
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30)
                    .copyWith(bottom: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty ||
                        value.length < 10 ||
                        value.length > 10) {
                      return "Poner CELULAR VÁLIDO DE 10 DÍGITOS";
                    } else {
                      return null;
                    }
                  },
                  controller: numeroController,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(color: Colors.red, fontSize: 14.5),
                  decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      prefixIconConstraints: const BoxConstraints(minWidth: 45),
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Colors.red,
                        size: 22,
                      ),
                      border: InputBorder.none,
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
              //Correo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30)
                    .copyWith(bottom: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^([a-zA-Z0-9])+([\.a-zA-Z0-9_-])*@([a-zA-Z0-9])+(\.[a-zA-Z0-9_-]+)+$')
                            .hasMatch(value)) {
                      return "Poner CORREO VÁLIDO";
                    } else {
                      return null;
                    }
                  },
                  controller: correoController,
                  keyboardType: TextInputType.emailAddress,
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
              //Domicilio
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
                  style: const TextStyle(color: Colors.red, fontSize: 14.5),
                  decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      prefixIconConstraints: const BoxConstraints(minWidth: 45),
                      prefixIcon: const Icon(
                        Icons.home,
                        color: Colors.red,
                        size: 22,
                      ),
                      border: InputBorder.none,
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
              const SizedBox(
                height: 40,
              ),
              //Boton Registro
              GestureDetector(
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    final String nombre = nombreController.text.trim();
                    final String numero = numeroController.text.trim();
                    final String domicilio = direccionController.text.trim();
                    final String correo = correoController.text.trim();
                    final docPaciente = FirebaseFirestore.instance
                        .collection('pacientes')
                        .doc(uid);

                    docPaciente.update({
                      'nombre': nombre,
                      'numero': numero,
                      'domicilio': domicilio,
                      'correo': correo
                    }).whenComplete(() async {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text('Se ha actualizado los datos con éxito')));
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString('nombre', nombre);
                      prefs.setString('numero', numero);
                      prefs.setString('direccion', domicilio);
                      prefs.setString('correo', correo);
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
                  child: Text('Actualizar Datos',
                      style: TextStyle(
                          color: Colors.white.withOpacity(.8),
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  signOut();
                },
                child: Container(
                  height: 53,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(100)
                        .copyWith(bottomRight: const Radius.circular(0)),
                  ),
                  child: Text('Cerrar Sesión',
                      style: TextStyle(
                          color: Colors.red.withOpacity(.8),
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
