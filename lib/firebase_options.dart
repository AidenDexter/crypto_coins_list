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
    apiKey: 'AIzaSyClpm_vqtjVsSdfdXCRhHTzVQmMkogN-N0',
    appId: '1:693837091957:web:1bd107230677f62271143c',
    messagingSenderId: '693837091957',
    projectId: 'flutter-crypto-coin',
    authDomain: 'flutter-crypto-coin.firebaseapp.com',
    storageBucket: 'flutter-crypto-coin.appspot.com',
    measurementId: 'G-XXNLBEKGZJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDdMazdl7oPAOLXf3965NhfsbFlUAuioDc',
    appId: '1:693837091957:android:57f3a7426859726171143c',
    messagingSenderId: '693837091957',
    projectId: 'flutter-crypto-coin',
    storageBucket: 'flutter-crypto-coin.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDaTHSqgH3DaQrcNZlv5J4DM6IyArF-Qs0',
    appId: '1:693837091957:ios:a10482d37d70ab8071143c',
    messagingSenderId: '693837091957',
    projectId: 'flutter-crypto-coin',
    storageBucket: 'flutter-crypto-coin.appspot.com',
    iosBundleId: 'com.example.cryptoCointsList',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDaTHSqgH3DaQrcNZlv5J4DM6IyArF-Qs0',
    appId: '1:693837091957:ios:6e17e8e3500f6d2971143c',
    messagingSenderId: '693837091957',
    projectId: 'flutter-crypto-coin',
    storageBucket: 'flutter-crypto-coin.appspot.com',
    iosBundleId: 'com.example.cryptoCointsList.RunnerTests',
  );
}
