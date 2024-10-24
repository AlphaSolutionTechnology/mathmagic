import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAnT2xWRNXDpWyyDSc3KFc-4e6EMXHDxak",
            authDomain: "mathmagic-d089e.firebaseapp.com",
            projectId: "mathmagic-d089e",
            storageBucket: "mathmagic-d089e.appspot.com",
            messagingSenderId: "286681738367",
            appId: "1:286681738367:web:8bc205abac602fdd02e34a",
            measurementId: "G-VMMYF9ML4Z"));
  } else {
    await Firebase.initializeApp();
  }
}
