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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDOgSEUCp89wrG6rAThk6FzJnwrUA1_GFU',
    appId: '1:553934441876:android:79dd48a801d06376b49381',
    messagingSenderId: '553934441876',
    projectId: 'az-shop-d7450',
    storageBucket: 'az-shop-d7450.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDikmptEyBumnnpKdBENCwFIIAwIeFzuRA',
    appId: '1:553934441876:ios:04ce2ad6896606c1b49381',
    messagingSenderId: '553934441876',
    projectId: 'az-shop-d7450',
    storageBucket: 'az-shop-d7450.appspot.com',
    androidClientId: '553934441876-ptq0o4tgvnnhc4hvg65iaopps3ei2j0t.apps.googleusercontent.com',
    iosClientId: '553934441876-43trug6k3k7uqgf5ob5nuvkd3nr91p6k.apps.googleusercontent.com',
    iosBundleId: 'com.example.tStore',
  );
}
