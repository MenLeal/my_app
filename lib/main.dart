import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Providers/notification.dart';
import 'package:my_app/Screen/adminpanel.dart';
import 'Screen/emailverif.dart';
import 'Screen/iniciosesion.dart';
import 'Screen/avisos.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  var login = prefs.getBool("login");
  var tipo = prefs.getString("tipo");
  var emailverif = prefs.getBool("emailverif");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final providerNotification = PushNotificationProvider();
  providerNotification.initNotifications();
  runApp(MaterialApp(
      title: 'AlarmApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: login == true && emailverif == true
          ? tipo == '2'
              ? const AdminPanel()
              : const AvisosPage()
          : login == true ? const EmailVerification() : const InicioPag(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es')
      ]));
}
