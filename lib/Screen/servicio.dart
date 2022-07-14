import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Servicio extends StatefulWidget {
  const Servicio({Key? key}) : super(key: key);

  @override
  State<Servicio> createState() => _ServicioState();
}

class _ServicioState extends State<Servicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PutoKike"), automaticallyImplyLeading: true),
      body: Center(child: Text("JAJAJ")),
    );
  }
}
