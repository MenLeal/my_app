import 'package:flutter/material.dart';
import '/Screen/iniciosesion.dart';
import '/Screen/registrosalud.dart';

class RegistroPag extends StatefulWidget {
  const RegistroPag({Key? key}) : super(key: key);

  @override
  State<RegistroPag> createState() => _RegistroPagState();
}

class _RegistroPagState extends State<RegistroPag> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  final formkey = GlobalKey<FormState>();

  final nombreController = TextEditingController();
  final direccionController = TextEditingController();
  final correoController = TextEditingController();
  final contraController = TextEditingController();
  final contracController = TextEditingController();
  final numeroController = TextEditingController();

  //Mostrar Dialog de Uso de Inforrmacion

  Future<void> showInformationDialog(BuildContext context, String nombre,
      String numero, String domicilio, String correo, String contra) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: const Text(
                  "El llenado de los datos que te solicita la aplicación ayudarán a salvar tu vida y ahorrarte gastos innecesarios en tus servicios"),
              title: const Text(
                'Uso de datos',
                style: TextStyle(color: Colors.red),
              ),
              actions: <Widget>[
                InkWell(
                  child: const Text('ACEPTAR',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => SaludDatos(
                            nombre: nombre,
                            numero: numero,
                            direccion: domicilio,
                            correo: correo,
                            contra: contra),
                      ),
                    );
                  },
                ),
              ],
            );
          });
        });
  }

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
                              "images/logogeneral.png",
                              width: 102,
                              alignment: Alignment.center,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Nuevo Usuario ',
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
                  //Nombre Completo
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30)
                        .copyWith(bottom: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Poner un NOMBRE COMPLETO VÁLIDO";
                        } else {
                          return null;
                        }
                      },
                      controller: nombreController,
                      keyboardType: TextInputType.name,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14.5),
                      decoration: InputDecoration(
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 45),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.white70,
                            size: 22,
                          ),
                          border: InputBorder.none,
                          errorStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          hintText: 'Nombres Apellido Apellido',
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
                  //Celular
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
                  //Contraseña
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
                  //Confirmar Contraseña
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30)
                        .copyWith(bottom: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 8) {
                          return "Poner una CONTRASEÑA MAYOR A 8 DIGITOS";
                        } else {
                          if (value != contraController.text) {
                            return "Poner CONTRASEÑA IGUAL";
                          }
                          return null;
                        }
                      },
                      controller: contracController,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14.5),
                      obscureText: isConfirmPasswordVisible ? false : true,
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
                                isConfirmPasswordVisible =
                                    !isConfirmPasswordVisible;
                              });
                            },
                            child: Icon(
                              isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white70,
                              size: 22,
                            ),
                          ),
                          border: InputBorder.none,
                          hintText: 'Confirmar Contraseña',
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
                        final String nombre = nombreController.text.trim();
                        final String numero = numeroController.text.trim();
                        final String domicilio =
                            direccionController.text.trim();
                        final String correo = correoController.text.trim();
                        final String contra = contraController.text.trim();
                        if (numero.length.isFinite && numero.length == 10) {
                          await showInformationDialog(context, nombre, numero,
                              domicilio, correo, contra);
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
