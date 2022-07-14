import 'package:flutter/material.dart';
import '/Screen/botonemergencia.dart';
import '/Screen/edituser.dart';
import '/Screen/servicios.dart';

class AvisosPage extends StatefulWidget {
  const AvisosPage({Key? key}) : super(key: key);

  @override
  State<AvisosPage> createState() => _AvisosPageState();
}

class _AvisosPageState extends State<AvisosPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    BotonEmergencia(),
    ServiciosPage(),
    EditarUser()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: 'Alerta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Servicios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Cuenta',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
