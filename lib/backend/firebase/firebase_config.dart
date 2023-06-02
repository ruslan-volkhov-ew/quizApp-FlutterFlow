import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

import 'google_services.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
      // name: 'quizapp',
      options: FirebaseOptions(
        apiKey: "AIzaSyBT4MqjSlxTn0Fhw0Xk48Y1MpSfHvZWSvg",
        authDomain: "quizapp-69a6b.firebaseapp.com",
        projectId: "quizapp-69a6b",
        storageBucket: "quizapp-69a6b.appspot.com",
        messagingSenderId: "478690371739",
        appId: "1:478690371739:web:e2ff63b67fcee031287e3e",
        measurementId: "G-PSPHZK6VY8",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
}

Future<FirebaseApp> initializeFirebaseApp(String baseName) async {
  final fileData =
      await rootBundle.loadString('$baseName/google-services.json');
  Map<String, dynamic> json = jsonDecode(fileData);
  final GoogleService config = GoogleService.fromJson(json);
  String measurementId;
  switch (baseName) {
    case 'quizapp':
      measurementId = "G-PSPHZK6VY8";
      break;
    case 'new1-quizapp':
      measurementId = "G-4EBHYE868G";
      break;
    default:
      measurementId = "G-PSPHZK6VY8";
  }
  final FirebaseOptions firebaseOptions = FirebaseOptions(
    appId: config.client![0].clientInfo!.mobilesdkAppId!,
    apiKey: config.client![0].apiKey![0].currentKey!,
    projectId: config.projectInfo!.projectId!,
    storageBucket: config.projectInfo!.storageBucket!,
    messagingSenderId: config.projectInfo!.projectNumber!,
    measurementId: measurementId,
    authDomain: '${config.projectInfo!.projectId}.firebaseapp.com',
  );
  return Firebase.initializeApp(
    name: baseName,
    options: firebaseOptions,
  );
}
