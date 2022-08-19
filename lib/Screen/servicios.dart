import 'package:flutter/material.dart';
import 'package:my_app/Screen/emailverif.dart';
import 'package:my_app/Screen/retropage.dart';
import 'package:my_app/Screen/servicio.dart';

class ServiciosPage extends StatefulWidget {
  const ServiciosPage({Key? key}) : super(key: key);

  @override
  State<ServiciosPage> createState() => _ServiciosPageState();
}

class _ServiciosPageState extends State<ServiciosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Servicios"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const EmailVerification(),
                ),
              );
            },
            icon: const Icon(Icons.message)
          ),
        ],
      ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Servicio(title: "Traslado"),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(5),
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/ambugeneral.png",
                    width: 150,
                    height: 90,
                  ),
                  const Text(
                    "Traslado en ambulancia",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Servicio(title: "Prueba COVID"),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(5),
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/covidtest.png",
                    width: 150,
                    height: 90,
                  ),
                  const Text(
                    "Prueba de COVID-19",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Card(
              margin: const EdgeInsets.all(5),
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/electro.png",
                    width: 150,
                    height: 90,
                  ),
                  const Text(
                    "Toma de electrocardiograma",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>
                      const Servicio(title: "Toma electrocardiograma"),
                ),
              );
            },
          ),
          GestureDetector(
            child: Card(
              margin: const EdgeInsets.all(5),
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/dengue.png",
                    width: 150,
                    height: 90,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Prueba de Dengue",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Servicio(title: "Prueba de Dengue"),
                ),
              );
            },
          ),
          GestureDetector(
            child: Card(
              margin: const EdgeInsets.all(5),
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/cert.png",
                    width: 150,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Certificado médico",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Servicio(title: "Certificado Médico"),
                ),
              );
            },
          ),
          GestureDetector(
            child: Card(
              margin: const EdgeInsets.all(5),
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/curacion.png",
                    width: 150,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Curación",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Servicio(title: "Curación"),
                ),
              );
            },
          ),
          GestureDetector(
            child: Card(
              margin: const EdgeInsets.all(5),
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/sutura.png",
                    width: 150,
                    height: 90,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Suturas",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Servicio(title: "Sutura"),
                ),
              );
            },
          ),
          GestureDetector(
            child: Card(
              margin: const EdgeInsets.all(5),
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/signos-vitales.png",
                    width: 150,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Toma de signos vitales",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>
                      const Servicio(title: "Toma de signos vitales"),
                ),
              );
            },
          ),
          GestureDetector(
            child: Card(
              margin: const EdgeInsets.all(5),
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/glucosa.png",
                    width: 150,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Toma de glucosa",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Servicio(title: "Toma de glucosa"),
                ),
              );
            },
          ),
          GestureDetector(
            child: Card(
              margin: const EdgeInsets.all(8),
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/urinario.png",
                    width: 150,
                    height: 100,
                  ),
                  const Text(
                    "Recambio de sondas urinarias",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>
                      const Servicio(title: "Recambio de sondas urinarias"),
                ),
              );
            },
          ),
          GestureDetector(
            child: Card(
              margin: const EdgeInsets.all(5),
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/consulta.png",
                    width: 150,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Consulta Médica General",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>
                      const Servicio(title: "Consulta Médica General"),
                ),
              );
            },
          ),
          GestureDetector(
            child: Card(
              margin: const EdgeInsets.all(5),
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/vacuna.png",
                    width: 150,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Inyección",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Servicio(title: "Inyección"),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
