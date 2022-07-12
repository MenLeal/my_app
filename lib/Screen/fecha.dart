import 'package:flutter/material.dart';

class Fecha extends StatefulWidget {
  const Fecha({Key? key}) : super(key: key);
  @override
  _FechaState createState() {
    return _FechaState();
  }
}

class _FechaState extends State<Fecha> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Datepicker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: const Text("Choose Date"),
            ),
            Text(
                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}")
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1970),
        lastDate: DateTime(2025),
        helpText: "SELECCIONE FECHA DE NACIMIENTO",
        cancelText: "CANCELAR",
        confirmText: "AGREGAR",
        fieldHintText: "dd/mm/yy",
        fieldLabelText: "FECHA DE NACIMIENTO",
        errorFormatText: "Introducir fomato correcto ej. 19/02/97",
        errorInvalidText: "Error en los datos Fecha fuera de rango",
        initialEntryMode: DatePickerEntryMode.input);
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }
}
