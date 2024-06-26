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
    apiKey: 'AIzaSyADv_qpM38dJSVrKNAww1ZBlBxIk3nmhKM',
    appId: '1:1032754109140:web:6ec5f5535b5d8f27417941',
    messagingSenderId: '1032754109140',
    projectId: 'expensetracker-667a9',
    authDomain: 'expensetracker-667a9.firebaseapp.com',
    storageBucket: 'expensetracker-667a9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBgxhmh02YC_v28_VYz5BqwDwBBHCWMV9s',
    appId: '1:1032754109140:android:120440f571c56b11417941',
    messagingSenderId: '1032754109140',
    projectId: 'expensetracker-667a9',
    storageBucket: 'expensetracker-667a9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjxwSvEGY3O0SL7kaUU_EHFaelldrcyL0',
    appId: '1:1032754109140:ios:fa49153c2303e5f5417941',
    messagingSenderId: '1032754109140',
    projectId: 'expensetracker-667a9',
    storageBucket: 'expensetracker-667a9.appspot.com',
    iosBundleId: 'com.example.expancetracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAjxwSvEGY3O0SL7kaUU_EHFaelldrcyL0',
    appId: '1:1032754109140:ios:e11359453196a2b8417941',
    messagingSenderId: '1032754109140',
    projectId: 'expensetracker-667a9',
    storageBucket: 'expensetracker-667a9.appspot.com',
    iosBundleId: 'com.example.expancetracker.RunnerTests',
  );
}
