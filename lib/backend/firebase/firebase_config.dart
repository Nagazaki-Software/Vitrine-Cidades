import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAL-8zXECd98YBoBvKbCcl8uTrzAxkSDyQ",
            authDomain: "vitrine-app-on7ygn.firebaseapp.com",
            projectId: "vitrine-app-on7ygn",
            storageBucket: "vitrine-app-on7ygn.firebasestorage.app",
            messagingSenderId: "64834951492",
            appId: "1:64834951492:web:e6813893b78fc2d7579f11"));
  } else {
    await Firebase.initializeApp();
  }
}
