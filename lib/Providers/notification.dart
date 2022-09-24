import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PushNotificationProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  initNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    _firebaseMessaging.requestPermission();
    _firebaseMessaging.getToken().then((token) {
      print(token);
      prefs.setString('token', token.toString());
    });
  }
}
