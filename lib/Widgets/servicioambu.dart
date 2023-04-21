import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/Screen/avisos.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/servicio.dart';

class ServicioAmbulancia extends StatefulWidget {
  const ServicioAmbulancia({Key? key}) : super(key: key);

  @override
  State<ServicioAmbulancia> createState() => _ServicioAmbulanciaState();
}

class _ServicioAmbulanciaState extends State<ServicioAmbulancia> {
  String date = "";
  DateTime selectedDate = DateTime.now();

  final formkey = GlobalKey<FormState>();

  final origen = TextEditingController();
  final destino = TextEditingController();
  final fecha = TextEditingController();

  String? oxigeno = "SI";
  List<String> listOxigeno = ["SI", "NO "];

  String? uid;
  void getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      uid = prefs.getString('uid')!;
      print(uid);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Traslado"),
        leading: InkWell(
          onTap: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.setInt('page', 1);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const AvisosPage(),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30)
                    .copyWith(top: 10),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.info_outline,
                              color: Colors.redAccent,
                            ),
                            Text(
                              " Costo de Recuperación",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                        const Text(
                          "Todo servicio brindado se requiere de una aportación voluntaria para poder ayudarle con las mejores condiciones",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //Origen
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30)
                    .copyWith(top: 10, bottom: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Poner un ORIGEN NO VACIO";
                    } else {
                      return null;
                    }
                  },
                  controller: origen,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(color: Colors.red, fontSize: 14.5),
                  decoration: InputDecoration(
                      prefixIconConstraints: const BoxConstraints(minWidth: 45),
                      prefixIcon: const Icon(
                        Icons.home,
                        color: Colors.red,
                        size: 22,
                      ),
                      border: InputBorder.none,
                      errorStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      hintText: 'Donde llegaremos',
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
              //Destino
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30)
                    .copyWith(bottom: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Poner DOMICILIO NO VACIO";
                    } else {
                      return null;
                    }
                  },
                  controller: destino,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.red, fontSize: 14.5),
                  decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      prefixIconConstraints: const BoxConstraints(minWidth: 45),
                      prefixIcon: const Icon(
                        Icons.location_city,
                        color: Colors.red,
                        size: 22,
                      ),
                      border: InputBorder.none,
                      hintText: 'Donde te llevaremos',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30)
                    .copyWith(bottom: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Poner DOMICILIO NO VACIO";
                    } else {
                      return null;
                    }
                  },
                  onTap: () async {
                    _selectDate(context);
                  },
                  readOnly: true,
                  controller: fecha,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.red, fontSize: 14.5),
                  decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      prefixIconConstraints: const BoxConstraints(minWidth: 45),
                      prefixIcon: const Icon(
                        Icons.calendar_today,
                        color: Colors.red,
                        size: 22,
                      ),
                      border: InputBorder.none,
                      hintText: "Seleccionar fecha",
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
              //Oxigeno
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40)
                    .copyWith(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Requiere oxígeno",
                      style: TextStyle(color: Colors.red, fontSize: 14.5),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    DropdownButton<String>(
                        elevation: 15,
                        icon: const Icon(
                          Icons.medical_information,
                          color: Colors.red,
                        ),
                        style:
                            const TextStyle(color: Colors.red, fontSize: 14.5),
                        dropdownColor: Colors.white,
                        value: oxigeno,
                        items: listOxigeno
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                ))
                            .toList(),
                        onChanged: (item) => setState(() => oxigeno = item)),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              //Boton Registro
              GestureDetector(
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    final String orig = origen.text.trim();
                    final String dest = destino.text.trim();
                    final String date = DateFormat.yMd().format(selectedDate);
                    var id = DateTime.now().millisecondsSinceEpoch.toString();
                    final _servicioDoc = FirebaseFirestore.instance
                        .collection('servicio')
                        .doc(id);
                    final servicio = Servicio(
                        id: id,
                        uid: uid,
                        origen: orig,
                        destino: dest,
                        tipo: "Traslado",
                        fecha: date,
                        estado: "pendiente",
                        oxigeno: oxigeno);
                    await _servicioDoc
                        .set(servicio.ambulanciaJson())
                        .whenComplete(() {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Se ha registrado su agenda')));

                      origen.text = "";
                      destino.text = "";
                      fecha.text = "";
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

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
      helpText: "SELECCIONE FECHA DE SERVICIO",
      cancelText: "CANCELAR",
      confirmText: "AGREGAR",
      fieldHintText: "dd/mm/yy",
      fieldLabelText: "FECHA DE SERVICIO",
      errorFormatText: "Introducir fomato correcto ej. 19/02/97",
      errorInvalidText: "Error en los datos Fecha fuera de rango",
    );
    if (selected != null) {
      setState(() {
        selectedDate = selected;
        fecha.text = DateFormat.yMMMMEEEEd('es').format(selectedDate);
      });
    }
  }
}
