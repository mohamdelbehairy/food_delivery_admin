import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/utils/service/firebase_service.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseService _firebaseService;

  AuthRepoImpl(this._firebaseService);
  @override
  Future<User?> register(String email, String password) async {
    return await _firebaseService.email(email, password);
  }

  @override
  Future<User?> login(String email, String password) async {
    return await _firebaseService.login(email, password);
  }
}
