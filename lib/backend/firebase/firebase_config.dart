import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBT4MqjSlxTn0Fhw0Xk48Y1MpSfHvZWSvg",
            authDomain: "quizapp-69a6b.firebaseapp.com",
            projectId: "quizapp-69a6b",
            storageBucket: "quizapp-69a6b.appspot.com",
            messagingSenderId: "478690371739",
            appId: "1:478690371739:web:e2ff63b67fcee031287e3e"));
  } else {
    await Firebase.initializeApp();
  }
}
