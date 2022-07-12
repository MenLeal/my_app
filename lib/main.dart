import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screen/iniciosesion.dart';
import 'Screen/avisos.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  var login = prefs.getBool("login");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    title: 'AlarmApp',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.red, accentColor: Colors.redAccent),
    home: login == true ? AvisosPage() : InicioPag(),
  ));
}
