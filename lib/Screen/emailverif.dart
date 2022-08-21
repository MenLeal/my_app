import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Screen/avisos.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key, this.correo}) : super(key: key);
  final String? correo;
  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendEmailVerification();
      timer = Timer.periodic(const Duration(seconds: 3), (_) {
        checkEmailVerified();
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  Future sendEmailVerification() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification().whenComplete(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Enviado")));
      }).onError((error, stackTrace) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString()))));
    } on FirebaseAuthException catch (e)  {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const AvisosPage()
      : Scaffold(
          appBar: AppBar(
            title: const Text("Verificar Correo"),
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Se ha enviado la verificación a su correo, si no la encuentra revise en la carpeta de SPAM",
                  style: TextStyle(
                    fontSize: 23,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10,),
                ElevatedButton.icon(
                  onPressed: resendEmail,
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50)),
                  icon: const Icon(
                    Icons.email,
                    size: 32,
                  ),
                  label: const Text(
                    'Reenviar Email ',
                    style: TextStyle(fontSize: 24),
                  ),
                )
              ],
            ),
          ),
        );

  void resendEmail() {}
  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified == true) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool("emailverif", true);
      prefs.setBool("login", true);
      timer?.cancel();
    }
  }
}
