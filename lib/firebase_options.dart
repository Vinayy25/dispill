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
    apiKey: 'AIzaSyAuhqyX-4ye601DOWsX1bw6a32-yP5POo8',
    appId: '1:973377612383:web:fbd7c5bc3d323060be49ea',
    messagingSenderId: '973377612383',
    projectId: 'dispill-alar',
    authDomain: 'dispill-alar.firebaseapp.com',
    storageBucket: 'dispill-alar.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDIpH6vOHgpi3FCmA-5IW30P0h1fjctIMQ',
    appId: '1:973377612383:android:4e9ab5ae4b6d914ebe49ea',
    messagingSenderId: '973377612383',
    projectId: 'dispill-alar',
    storageBucket: 'dispill-alar.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBYx6uhK_K-oYbZ1WqmrptL1JLO_zpEVdY',
    appId: '1:973377612383:ios:186a02c1f9986074be49ea',
    messagingSenderId: '973377612383',
    projectId: 'dispill-alar',
    storageBucket: 'dispill-alar.appspot.com',
    iosBundleId: 'com.example.dispill',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBYx6uhK_K-oYbZ1WqmrptL1JLO_zpEVdY',
    appId: '1:973377612383:ios:82f2d1cde67ef561be49ea',
    messagingSenderId: '973377612383',
    projectId: 'dispill-alar',
    storageBucket: 'dispill-alar.appspot.com',
    iosBundleId: 'com.example.dispill.RunnerTests',
  );
}