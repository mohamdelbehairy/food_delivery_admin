import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  Future<User?> email(String email, String password) async {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    return userCredential.user;
  }

  Future<User?> login(String email, String password) async {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return userCredential.user;
  }
}
