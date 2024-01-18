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
    apiKey: 'AIzaSyARvQnZVM-mq1j-KExz_ZuC152DYDh_QbE',
    appId: '1:785896990662:web:8576711e7d5ac6d57c74c7',
    messagingSenderId: '785896990662',
    projectId: 'connect-firebase-9a28b',
    authDomain: 'connect-firebase-9a28b.firebaseapp.com',
    storageBucket: 'connect-firebase-9a28b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPjPS0jSuYwM4V9wY_AQIS13HMeo4J7j0',
    appId: '1:785896990662:android:7abbf4d63e27e6817c74c7',
    messagingSenderId: '785896990662',
    projectId: 'connect-firebase-9a28b',
    storageBucket: 'connect-firebase-9a28b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSVAGRJ3kYeULbbeTz59biGag27xfqqzU',
    appId: '1:785896990662:ios:adfd1070a30c9cc67c74c7',
    messagingSenderId: '785896990662',
    projectId: 'connect-firebase-9a28b',
    storageBucket: 'connect-firebase-9a28b.appspot.com',
    iosBundleId: 'com.example.connectFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCSVAGRJ3kYeULbbeTz59biGag27xfqqzU',
    appId: '1:785896990662:ios:9d371bfaefbc85227c74c7',
    messagingSenderId: '785896990662',
    projectId: 'connect-firebase-9a28b',
    storageBucket: 'connect-firebase-9a28b.appspot.com',
    iosBundleId: 'com.example.connectFirebase.RunnerTests',
  );
}