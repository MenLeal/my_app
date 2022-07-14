import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Screen/avisos.dart';
import 'package:my_app/Widgets/serviciodeleg.dart';
import 'package:my_app/Widgets/serviciohogar.dart';

class ServicioRegular extends StatefulWidget {
  const ServicioRegular({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  State<ServicioRegular> createState() => _ServicioRegularState();
}

class _ServicioRegularState extends State<ServicioRegular> {
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

  final CollectionReference _servicios =
      FirebaseFirestore.instance.collection('servicio');
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title!),
            leading: InkWell(
              onTap: () {
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
            bottom: const TabBar(tabs: [
              Tab(
                text: "Domicilio",
                icon: Icon(Icons.home),
              ),
              Tab(
                text: "Delegación",
                icon: Icon(Icons.add_home_work),
              ),
            ]),
          ),
          body: const TabBarView(children: [Hogar(), Delegacion()])),
    );
  }
}
