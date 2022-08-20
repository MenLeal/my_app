import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Screen/avisos.dart';
import 'package:my_app/Widgets/serviciodeleg.dart';
import 'package:my_app/Widgets/serviciohogar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicioRegular extends StatefulWidget {
  const ServicioRegular({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  State<ServicioRegular> createState() => _ServicioRegularState();
}

class _ServicioRegularState extends State<ServicioRegular> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title!),
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
          body: TabBarView(children: [
            Hogar(
              title: widget.title,
            ),
            Delegacion(title: widget.title)
          ])),
    );
  }
}
