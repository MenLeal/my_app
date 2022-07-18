import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Models/servicio.dart';

import '../Widgets/navigationdrawer.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Admin Panel")),
        drawer: const NavigationDrawer(),
        body: StreamBuilder<List<Servicio>>(
            stream: readServicios(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Salio mal");
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
        subtitle: Text("${e.fecha}"),
        trailing: ElevatedButton(
          child: Text("${e.oxigeno}"),
          onPressed: () => print("action button"),
        ),
      );
}

Stream<List<Servicio>> readServicios() => FirebaseFirestore.instance
    .collection('servicio')
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((e) => Servicio.fromJsonReg(e.data())).toList());
