import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider{

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  

  initNotifications() async {
    _firebaseMessaging.requestPermission();
    _firebaseMessaging.getToken().then((token) {
      print(token);
    });
  } 
  

}