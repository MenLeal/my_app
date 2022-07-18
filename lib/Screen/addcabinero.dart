import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
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

  final fecha = TextEditingController();
  final destino = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo Cabinero"),
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
                          "Todo servicio brindado requiere de una aportación voluntaria para poder ayudarle con las mejores condiciones",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //Destino
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30)
                    .copyWith(top: 10, bottom: 10),
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
                        Icons.home,
                        color: Colors.red,
                        size: 22,
                      ),
                      border: InputBorder.none,
                      hintText: 'Donde te atenderemos',
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
              //Fecha
              const SizedBox(
                height: 40,
              ),
              //Boton Registro
              GestureDetector(
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    final String dest = destino.text.trim();
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
      helpText: "SELECCIONE FECHA DEL SERVICIO",
      cancelText: "CANCELAR",
      confirmText: "AGREGAR",
      fieldHintText: "dd/mm/yy",
      fieldLabelText: "FECHA DEL SERVICIO",
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