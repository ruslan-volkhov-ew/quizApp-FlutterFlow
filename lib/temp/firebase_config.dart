import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDIdCJnpGCnZwfGSppk-dHIjBNFXba9d0o",
            authDomain: "new1-quizapp-dee68.firebaseapp.com",
            projectId: "new1-quizapp-dee68",
            storageBucket: "new1-quizapp-dee68.appspot.com",
            messagingSenderId: "931847884577",
            appId: "1:931847884577:web:6bfbfc0759bd4940983860",
            measurementId: "G-4EBHYE868G"));
  } else {
    await Firebase.initializeApp();
  }
}
