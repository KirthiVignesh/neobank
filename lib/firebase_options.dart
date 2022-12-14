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
    apiKey: 'AIzaSyBJr-y8Ei6zaBzsxoZA3ORpt6b3-8G2bfY',
    appId: '1:880513019281:web:6e70fe3f7b94bd3eb27e30',
    messagingSenderId: '880513019281',
    projectId: 'neobank-a2c13',
    authDomain: 'neobank-a2c13.firebaseapp.com',
    storageBucket: 'neobank-a2c13.appspot.com',
    measurementId: 'G-G8HHGMNS87',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzPFLbh4kpueZUhc8Xp4piCPn7E9xhjNE',
    appId: '1:880513019281:android:a2f8468f639a6adbb27e30',
    messagingSenderId: '880513019281',
    projectId: 'neobank-a2c13',
    storageBucket: 'neobank-a2c13.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_8QqQb9qvywnFyTE7oeteEEFbUKs1WGw',
    appId: '1:880513019281:ios:81cf7b287e72ed87b27e30',
    messagingSenderId: '880513019281',
    projectId: 'neobank-a2c13',
    storageBucket: 'neobank-a2c13.appspot.com',
    iosClientId: '880513019281-9ht555cno54agqtqr5afksg24skamrdi.apps.googleusercontent.com',
    iosBundleId: 'com.example.neobank',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_8QqQb9qvywnFyTE7oeteEEFbUKs1WGw',
    appId: '1:880513019281:ios:81cf7b287e72ed87b27e30',
    messagingSenderId: '880513019281',
    projectId: 'neobank-a2c13',
    storageBucket: 'neobank-a2c13.appspot.com',
    iosClientId: '880513019281-9ht555cno54agqtqr5afksg24skamrdi.apps.googleusercontent.com',
    iosBundleId: 'com.example.neobank',
  );
}
