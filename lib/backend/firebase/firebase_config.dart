import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCEFCqLL7qgr1U0U_0jwKfqF3JtxgQaWM4",
            authDomain: "alpha-10399.firebaseapp.com",
            projectId: "alpha-10399",
            storageBucket: "alpha-10399.appspot.com",
            messagingSenderId: "643346933640",
            appId: "1:643346933640:web:6b59e77fc433269dde3c3d",
            measurementId: "G-T3QB6L19TQ"));
  } else {
    await Firebase.initializeApp();
  }
}
