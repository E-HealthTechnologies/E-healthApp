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
    apiKey: 'AIzaSyBM5fofscruu2Ur5mt9HLxz0jRGFc7LWyM',
    appId: '1:972243313649:web:00d7ec91727970da0fda50',
    messagingSenderId: '972243313649',
    projectId: 'e-health-tech',
    authDomain: 'e-health-tech.firebaseapp.com',
    storageBucket: 'e-health-tech.appspot.com',
    measurementId: 'G-YSYN93DB7Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIDXVDf-My29DP03KwQF3uu9kvtpvj5H0',
    appId: '1:972243313649:android:3658d740a81f507d0fda50',
    messagingSenderId: '972243313649',
    projectId: 'e-health-tech',
    storageBucket: 'e-health-tech.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhztnrZaa7w59Cwl-ZyoA9daP3n-Ae6Y4',
    appId: '1:972243313649:ios:a22425289c3c19290fda50',
    messagingSenderId: '972243313649',
    projectId: 'e-health-tech',
    storageBucket: 'e-health-tech.appspot.com',
    iosClientId: '972243313649-6cql0518i56cuopoctjv52lkak37ivnu.apps.googleusercontent.com',
    iosBundleId: 'com.EhealthTech.app.eHealth',
  );
}
