import 'package:firebase_auth/firebase_auth.dart';

import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuth _auth;

  AuthRepoImpl(this._auth);
  @override
  Future<User?> register(String email, String password) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    return userCredential.user;
  }

  @override
  Future<User?> login(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    return userCredential.user;
  }

  @override
  Future<void> forgotPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }
}
