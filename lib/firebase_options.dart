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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAjAqGhMinUtkGiNw-sHlrMTydQzjb0PSw',
    appId: '1:357553141617:web:ea5b5ca0a946720d8528d0',
    messagingSenderId: '357553141617',
    projectId: 'organizador-presentes',
    authDomain: 'organizador-presentes.firebaseapp.com',
    storageBucket: 'organizador-presentes.firebasestorage.app',
    measurementId: 'G-PEWC9256D0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBACvMZ1HEQM0Op4PsZMqNKiWO84Vu9thk',
    appId: '1:357553141617:android:8c2eaf5d4d29c6ea8528d0',
    messagingSenderId: '357553141617',
    projectId: 'organizador-presentes',
    storageBucket: 'organizador-presentes.firebasestorage.app',
  );
}
