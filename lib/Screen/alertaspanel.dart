import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Models/alerta.dart';
import '../Widgets/navigationdrawer.dart';

class AlertasPanel extends StatefulWidget {
  const AlertasPanel({Key? key}) : super(key: key);

  @override
  State<AlertasPanel> createState() => _AlertasPanelState();
}

class _AlertasPanelState extends State<AlertasPanel> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Alertas Recibidas")),
        drawer: const NavigationDrawer(),
        body: StreamBuilder<List<Alerta>>(
            stream: readAlertas(),
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
        leading: CircleAvatar(child: Text("${e.id}")),
        title: Text("${e.latitud}"),
        subtitle: Text("${e.longitud}"),
        trailing: ElevatedButton(
          child: Text("${e.estado}"),
          onPressed: () => print("mostrar detalles"),
        ),
      );
}
Stream<List<Alerta>> readAlertas() => FirebaseFirestore.instance
    .collection('alertas')
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((e) => Alerta.fromJson(e.data())).toList());
