import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<UserCredential?> emailSignInFunc(
  String email,
  String password,
  FirebaseApp? firebaseApp,
) {
  if (firebaseApp != null) {
    FirebaseAuth auth = FirebaseAuth.instanceFor(app: firebaseApp);
    return auth.signInWithEmailAndPassword(
        email: email.trim(), password: password);
  } else {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.trim(), password: password);
  }
}

Future<UserCredential?> emailCreateAccountFunc(
  String email,
  String password,
) =>
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
