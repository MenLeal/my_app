import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Models/servicio.dart';
import '../Widgets/navigationdrawer.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {


  Future<void> showInformationDialog(String destino, String string,
    BuildContext context,
  ) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: const Text(
                  "MANTENER PRESIONADO el botón para enviar alerta a la central. A continuación se le hará una llamada para confirmar la emergencia"),
              title: Row(
                children: const [
                  Icon(Icons.send_outlined, color: Colors.red),
                  Text(
                    ' Enviar Alerta',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Servicios Agendados")),
        drawer: const NavigationDrawer(),
        body: StreamBuilder<List<Servicio>>(
            stream: readServicios(),
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

  Widget buildServicio(Servicio e) => ListTile(
        leading: CircleAvatar(child: Text("${e.id}")),
        title: Text("${e.tipo}"),
        subtitle: Row(
          children: [
            const Icon(Icons.location_city),
            Text("${e.destino}"),
          ],
        ),
        trailing: ElevatedButton(
          child: Text("${e.fecha}"),
          onPressed: () => print("mostrar detalles"),
        ),
      );
}

Stream<List<Servicio>> readServicios() => FirebaseFirestore.instance
    .collection('servicio')
    .where("tipo", isNotEqualTo: "Traslado")
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((e) => Servicio.fromJsonReg(e.data())).toList());
