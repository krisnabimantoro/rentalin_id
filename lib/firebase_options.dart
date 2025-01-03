// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyA7hKNu3_KY0s1kp5-ipMcJhnd1G94CMGU',
    appId: '1:351000962286:web:1b8e04cce489b68286ffff',
    messagingSenderId: '351000962286',
    projectId: 'rentalinid-7883c',
    authDomain: 'rentalinid-7883c.firebaseapp.com',
    storageBucket: 'rentalinid-7883c.appspot.com',
    measurementId: 'G-DSJG6H40EB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC673HCCERUuLWn8ovMNeLe1gtdr_kdN9U',
    appId: '1:351000962286:android:88b6bd88a183041586ffff',
    messagingSenderId: '351000962286',
    projectId: 'rentalinid-7883c',
    storageBucket: 'rentalinid-7883c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCV06wBSZKcL335zVzFeFYLzsf3lTzw6zk',
    appId: '1:351000962286:ios:7538717f1c1d4ac486ffff',
    messagingSenderId: '351000962286',
    projectId: 'rentalinid-7883c',
    storageBucket: 'rentalinid-7883c.appspot.com',
    iosBundleId: 'com.example.rentalinId',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCV06wBSZKcL335zVzFeFYLzsf3lTzw6zk',
    appId: '1:351000962286:ios:7538717f1c1d4ac486ffff',
    messagingSenderId: '351000962286',
    projectId: 'rentalinid-7883c',
    storageBucket: 'rentalinid-7883c.appspot.com',
    iosBundleId: 'com.example.rentalinId',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA7hKNu3_KY0s1kp5-ipMcJhnd1G94CMGU',
    appId: '1:351000962286:web:8bf00065e3da364f86ffff',
    messagingSenderId: '351000962286',
    projectId: 'rentalinid-7883c',
    authDomain: 'rentalinid-7883c.firebaseapp.com',
    storageBucket: 'rentalinid-7883c.appspot.com',
    measurementId: 'G-SYSNGQ9RVV',
  );

}