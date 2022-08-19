import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/Screen/addcabinero.dart';
import 'package:my_app/Screen/alertaspanel.dart';
import 'package:my_app/Screen/trasladospanel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Screen/adminpanel.dart';
import '../Screen/iniciosesion.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String? tipo;
  String? nombre;
  Future signOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    await FirebaseAuth.instance.signOut().whenComplete(() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const InicioPag()),
      );
    });
  }

  @override
  void initState() {
    getPrefs();
    super.initState();
  }

  void getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      tipo = prefs.getString("tipo");
      nombre = prefs.getString("nombre");
    });
  }

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenu(context),
          ],
        )),
      );

  Widget buildHeader(BuildContext context) => Container(
        color: Colors.red,
        padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top, bottom: 20, left: 24),
        child: Row(
          children: [
            const Icon(
              Icons.person_rounded,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              nombre.toString(),
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      );

  Widget buildMenu(BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          runSpacing: 10,
          children: [
            ListTile(
              leading: const Icon(
                Icons.airport_shuttle,
                color: Colors.red,
              ),
              title: const Text("Traslados"),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const TrasladosPanel(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.medical_information, color: Colors.red),
              title: const Text("Servicios"),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const AdminPanel(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.emergency_outlined, color: Colors.red),
              title: const Text("Alertas"),
              onTap: () {
                Navigator.of(context).pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AlertasPanel(),
                  ),
                );
              },
            ),
            tipo == "2"
                ? ListTile(
                    leading: const Icon(Icons.person_add, color: Colors.red),
                    title: const Text("Agregar Cabinero"),
                    onTap: () {
                      Navigator.of(context).pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AgregarCabinero(),
                        ),
                      );
                    },
                  )
                : Text(""),
            const Divider(color: Colors.black54),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Cerrar Sesión"),
              onTap: () async {
                signOut();
              },
            )
          ],
        ),
      );
}
