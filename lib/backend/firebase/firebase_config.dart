import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "SECRET",
            authDomain: "pdp-voting-page.firebaseapp.com",
            projectId: "pdp-voting-page",
            storageBucket: "pdp-voting-page.firebasestorage.app",
            messagingSenderId: "234573015999",
            appId: "1:234573015999:web:c6dea4b63fe44fa8a18f0a",
            measurementId: "G-SFJEWFZLET"));
  } else {
    await Firebase.initializeApp();
  }
}
