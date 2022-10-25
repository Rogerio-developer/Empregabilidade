// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyBIuUg7ef0NyoXIgZYVsRsQPbfF-9s5wzc',
    appId: '1:139148720512:web:0ba5a1638316a197782965',
    messagingSenderId: '139148720512',
    projectId: 'empregabilidade-entra21-69d19',
    authDomain: 'empregabilidade-entra21-69d19.firebaseapp.com',
    storageBucket: 'empregabilidade-entra21-69d19.appspot.com',
    measurementId: 'G-WGDDMHE0CM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvJr0ofIlP7BfcDy3Yb0I4rmL0j5hwxkA',
    appId: '1:139148720512:android:f4031e56ec386482782965',
    messagingSenderId: '139148720512',
    projectId: 'empregabilidade-entra21-69d19',
    storageBucket: 'empregabilidade-entra21-69d19.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFqhace_9Qlq9UIDZS6-sYCPEzsdQkG80',
    appId: '1:139148720512:ios:19214fd57cf50d1a782965',
    messagingSenderId: '139148720512',
    projectId: 'empregabilidade-entra21-69d19',
    storageBucket: 'empregabilidade-entra21-69d19.appspot.com',
    iosClientId:
        '139148720512-qk8ohmcg66evr3pmckoanuapvp4ufeol.apps.googleusercontent.com',
    iosBundleId: 'com.example.empregabildade',
  );
}
