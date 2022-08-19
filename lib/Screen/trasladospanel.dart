import 'package:flutter/material.dart';
import 'package:my_app/Models/servicio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Widgets/navigationdrawer.dart';



class TrasladosPanel extends StatefulWidget {
  const TrasladosPanel({Key? key}) : super(key: key);

  @override
  State<TrasladosPanel> createState() => _TrasladosPanelState();
}

class _TrasladosPanelState extends State<TrasladosPanel> {
 @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Traslados Agendados")),
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
        title: Text("${e.destino}"),
        subtitle: Text("${e.fecha}"),
        trailing: ElevatedButton(
          child: Text("${e.oxigeno}"),
          onPressed: () => print("mostrar detalles"),
        ),
      );
}

Stream<List<Servicio>> readServicios() => FirebaseFirestore.instance
    .collection('servicio').where("tipo", isEqualTo: "Traslado")
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((e) => Servicio.fromJsonAmb(e.data())).toList());