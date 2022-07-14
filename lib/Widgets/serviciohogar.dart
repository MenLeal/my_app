import 'package:flutter/material.dart';

class Hogar extends StatefulWidget {
  const Hogar({Key? key}) : super(key: key);

  @override
  State<Hogar> createState() => _HogarState();
}

class _HogarState extends State<Hogar> {
  String date = "";
  DateTime selectedDate = DateTime.now();

  final formkey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  final origen = TextEditingController();
  final direccionController = TextEditingController();
  final correoController = TextEditingController();
  final contraController = TextEditingController();
  final contracController = TextEditingController();
  final numeroController = TextEditingController();

  String? sangre = "A+";
  List<String> listSangre = ["A+", "A-", "O+", "O-", "AB+", "AB-", "B+", "B-"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 10),
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
                controller: numeroController,
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
              child: ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Row(
                  children: const [
                    Icon(Icons.date_range),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Dia del Servicio"),
                  ],
                ),
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
                  final String dest = numeroController.text.trim();
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
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }
}
