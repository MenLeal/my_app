import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BotonEmergencia extends StatefulWidget {
  const BotonEmergencia({Key? key}) : super(key: key);

  @override
  State<BotonEmergencia> createState() => _BotonEmergenciaState();
}

class _BotonEmergenciaState extends State<BotonEmergencia> {
  bool pressed = false;
  String? uid;

  final CollectionReference _alertas =
      FirebaseFirestore.instance.collection('alertas');

  Position? _position;
  void getLocation() async {
    Position position = await _determinePosition();
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _position = position;
      uid = prefs.getString("uid");
    });
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location DENIED');
      }
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> showInformationDialog(
    BuildContext context,
  ) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return const AlertDialog(
              content: Text(
                  "MANTENER PRESIONADO el botón para enviar alerta a la central. A continuación se le hará una llamada para confirmar la emergencia"),
              title: Text(
                'Enviar Alerta',
                style: TextStyle(color: Colors.red),
              ),
            );
          });
        });
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Enviar Emergencia"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.question_mark),
              onPressed: () {
                showInformationDialog(context);
              },
            ),
          ],
        ),
        body: Center(
            widthFactor: 1,
            heightFactor: 2,
            child: MaterialButton(
              height: 20,
              onPressed: () {},
              color: Colors.white,
              shape: const CircleBorder(),
              onLongPress: () async {
                getLocation();
                await _alertas.add({
                  "uid": uid,
                  "latitud": _position!.latitude.toString(),
                  "longitud": _position!.longitude.toString(),
                  "fechahora":
                      DateFormat('d/M/y').add_jm().format(DateTime.now()),
                }).whenComplete(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Se ha enviado la alerta')));
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Image.asset("images/cruzbutton.png"),
              ),
            )));
  }
}
