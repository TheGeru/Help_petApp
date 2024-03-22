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
    apiKey: 'AIzaSyC2KOsEF7w_mCKmGqZkCFKwxRRUVNloQ08',
    appId: '1:342259377951:web:7ac18a2a07748c1f83322a',
    messagingSenderId: '342259377951',
    projectId: 'help-petapp',
    authDomain: 'help-petapp.firebaseapp.com',
    storageBucket: 'help-petapp.appspot.com',
    measurementId: 'G-0RKFZBPZY3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAh1uSdrLTMUxTRNdhzBzKVUZ9iFzp4XfM',
    appId: '1:342259377951:android:c73047114d0e0b1a83322a',
    messagingSenderId: '342259377951',
    projectId: 'help-petapp',
    storageBucket: 'help-petapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxnQELyrnteHw1X6Au7qGgqfdDFyZ1LB8',
    appId: '1:342259377951:ios:fa024fe044622bdd83322a',
    messagingSenderId: '342259377951',
    projectId: 'help-petapp',
    storageBucket: 'help-petapp.appspot.com',
    iosBundleId: 'com.example.helpPetApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCxnQELyrnteHw1X6Au7qGgqfdDFyZ1LB8',
    appId: '1:342259377951:ios:33ed9333e6f49e5f83322a',
    messagingSenderId: '342259377951',
    projectId: 'help-petapp',
    storageBucket: 'help-petapp.appspot.com',
    iosBundleId: 'com.example.helpPetApp.RunnerTests',
  );
}