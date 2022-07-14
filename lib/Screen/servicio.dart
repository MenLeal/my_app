import 'package:flutter/material.dart';
import 'package:my_app/Widgets/servicioambu.dart';
import 'package:my_app/Widgets/servicioregular.dart';

class Servicio extends StatefulWidget {
  const Servicio({Key? key, required this.title}) : super(key: key);
  final String? title;

  @override
  State<Servicio> createState() => _ServicioState();
}

class _ServicioState extends State<Servicio> {
  @override
  Widget build(BuildContext context) {
    if (widget.title == "Traslado") {
      return const ServicioAmbulancia();
    } else {
      return ServicioRegular(title: widget.title);
    }
  }
}
