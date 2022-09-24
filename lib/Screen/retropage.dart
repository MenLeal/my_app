import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/Models/alerta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_app/Screen/avisos.dart';

class RetroPage extends StatefulWidget {
  const RetroPage({Key? key}) : super(key: key);

  @override
  State<RetroPage> createState() => _RetroPageState();
}

class _RetroPageState extends State<RetroPage> {
  String? uid;
  void getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      uid = prefs.getString('uid')!;
    });
  }

  Future<void> showInformationDialog(BuildContext context, String estado,
      String motivo, String datetime, String fechahoramotivo) async {
        int timestamp = int.parse(datetime);
        var date= DateFormat('d/M/y').add_jm().format( DateTime.fromMillisecondsSinceEpoch(timestamp));
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Wrap(
                spacing: 2,
                alignment: WrapAlignment.center,
                children: [
                  Column(
                    children: [
                      motivo != "null"
                          ? const SizedBox()
                          : estado == "aceptada"
                              ? const SizedBox()
                              : const Text("Procesando Solicitud"),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Enviada: $date",
                            style: const TextStyle(
                                fontSize: 16, fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          estado == "pendiente"
                              ? const Text("En Revisión")
                              : Text(
                                  "Respondida: $fechahoramotivo",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic),
                                )
                        ],
                      )
                    ],
                  )
                ],
              ),
              title: Row(
                children: const [
                  Icon(Icons.info_outline_rounded, color: Colors.red),
                  Text(
                    ' Detalles',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            );
          });
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Mis Notificaciones"),
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
        body: StreamBuilder<List<Alerta>>(
            stream: readAlertas(uid),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Salio mal");
              } else if (snapshot.hasData) {
                final servicios = snapshot.data!;
                return ListView(
                  children: servicios.map(buildServicio).toList(),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      );
  Widget buildServicio(Alerta e) => ListTile(
        leading: CircleAvatar(
            backgroundColor: e.estado.toString() == "pendiente"
                ? const Color.fromARGB(255, 235, 235, 235)
                : e.estado.toString() == "aceptada"
                    ? const Color.fromARGB(255, 3, 189, 96)
                    : const Color.fromARGB(255, 150, 4, 4),
            child: e.estado.toString() == "pendiente"
                ? const Icon(Icons.pending_actions)
                : e.estado.toString() == "aceptada"
                    ? const Icon(Icons.done, color: Colors.white)
                    : const Icon(Icons.block)),
        title: Text("${e.estado}"),
        subtitle: Row(
          children: [
            const Icon(Icons.location_on, color: Colors.red),
            Text("${e.longitud}"),
            const Text(","),
            const SizedBox(width: 5,),
            Text("${e.latitud}"),
          ],
        ),
        trailing: ElevatedButton(
          child: const Text("Detalles"),
          onPressed: () => showInformationDialog(context, "${e.estado}",
              "${e.motivo}", "${e.fechahora}", "${e.fechahoramotivo} "),
        ),
      );
}

Stream<List<Alerta>> readAlertas(String? uid) => FirebaseFirestore.instance
    .collection('alertas')
    .where("uid", isEqualTo: uid)
    .orderBy("fechahora",descending: true)
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((e) => Alerta.fromJson(e.data())).toList());
