import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Screen/inicioadmin.dart';
import 'package:my_app/registro.dart';
import '/Screen/avisos.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InicioPag extends StatefulWidget {
  const InicioPag({Key? key}) : super(key: key);

  @override
  State<InicioPag> createState() => _InicioPagState();
}

class _InicioPagState extends State<InicioPag> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  final correoController = TextEditingController();
  final contraController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                              "images/logogeneral.png",
                              width: 102,
                              alignment: Alignment.center,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'AlarmApp ',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                        color: Colors.black45,
                                        offset: const Offset(1, 1),
                                        blurRadius: 5)
                                  ]),
                            ),
                          ],
                        ),
                      ),
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
                          return "Poner CORREO correcto";
                        } else {
                          return null;
                        }
                      },
                      controller: correoController,
                      keyboardType: TextInputType.emailAddress,
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
                            Icons.email,
                            color: Colors.white70,
                            size: 22,
                          ),
                          border: InputBorder.none,
                          hintText: 'correo@ejemplo.com',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30)
                        .copyWith(bottom: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 8) {
                          return "Poner una CONTRASEÑA VÁLIDA";
                        } else {
                          return null;
                        }
                      },
                      controller: contraController,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14.5),
                      obscureText: isPasswordVisible ? false : true,
                      decoration: InputDecoration(
                          errorStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 45),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white70,
                            size: 22,
                          ),
                          suffixIconConstraints:
                              const BoxConstraints(minWidth: 45, maxWidth: 46),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            child: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white70,
                              size: 22,
                            ),
                          ),
                          border: InputBorder.none,
                          hintText: 'Contraseña',
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
                    height: 30,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      signIn();
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
                      child: Text('Iniciar Sesion',
                          style: TextStyle(
                              color: Colors.white.withOpacity(.8),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('¿No tiene una cuenta?',
                      style: TextStyle(color: Colors.white70, fontSize: 13)),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const RegistroPag(),
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
                      child: Text('Registrarse',
                          style: TextStyle(
                              color: Colors.white.withOpacity(.8),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 23,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    child: GestureDetector(
                        onTap: (() {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const InicioAdmin(),
                            ),
                          );
                        }),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Admin',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.8),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            const Icon(
                              Icons.admin_panel_settings,
                              color: Colors.white,
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    if (formkey.currentState!.validate()) {
      final String correo = correoController.text.trim();
      final String contra = contraController.text.trim();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: correo, password: contra)
          .whenComplete(() async {
        final prefs = await SharedPreferences.getInstance();
        final uid = FirebaseAuth.instance.currentUser!.uid;
        prefs.setString('uid', uid);
        prefs.setBool("login", true);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const AvisosPage(),
          ),
        );
      });
    }
  }
}
