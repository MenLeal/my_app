// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCvp2y6a7-PnMeuZYQc3mhPSLrjmuR5R18',
    appId: '1:703653145187:web:f0751ff7f432076f80a656',
    messagingSenderId: '703653145187',
    projectId: 'alarmapp-d8876',
    authDomain: 'alarmapp-d8876.firebaseapp.com',
    storageBucket: 'alarmapp-d8876.appspot.com',
    measurementId: 'G-HMZLQXW5NR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdNUwZIm1r_b-UwyV15jEkiBPDZRU5mpo',
    appId: '1:703653145187:android:41e70e76645b1e4880a656',
    messagingSenderId: '703653145187',
    projectId: 'alarmapp-d8876',
    storageBucket: 'alarmapp-d8876.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBuwetcT3UQnpy6YNGCjD0dStNhr5uvUN0',
    appId: '1:703653145187:ios:dd3b910e247ce58780a656',
    messagingSenderId: '703653145187',
    projectId: 'alarmapp-d8876',
    storageBucket: 'alarmapp-d8876.appspot.com',
    iosClientId: '703653145187-3d2l8c9lf35e6u2sknffupbqvfh03d55.apps.googleusercontent.com',
    iosBundleId: 'com.example.myApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBuwetcT3UQnpy6YNGCjD0dStNhr5uvUN0',
    appId: '1:703653145187:ios:dd3b910e247ce58780a656',
    messagingSenderId: '703653145187',
    projectId: 'alarmapp-d8876',
    storageBucket: 'alarmapp-d8876.appspot.com',
    iosClientId: '703653145187-3d2l8c9lf35e6u2sknffupbqvfh03d55.apps.googleusercontent.com',
    iosBundleId: 'com.example.myApp',
  );
}