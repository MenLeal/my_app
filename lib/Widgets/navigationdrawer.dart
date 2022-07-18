import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/Screen/addcabinero.dart';
import 'package:my_app/Screen/emailverif.dart';
import 'package:my_app/Widgets/servicioregular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screen/adminpanel.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String? tipo;
  @override
  void initState() {
    getPrefs();
    super.initState();
  }

  void getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    tipo = prefs.getString("tipo");
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
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      );

  Widget buildMenu(BuildContext context) => Column(
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Inicio"),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const AdminPanel(),
                ),
              );
            },
          ),
          tipo != "2"
              ? ListTile(
                  leading: const Icon(Icons.person_add),
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
              : Text("?"),
        ],
      );
}
