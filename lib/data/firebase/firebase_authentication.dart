import 'package:dk_mov/data/repositories/authentication.dart';
import 'package:dk_mov/domain/entities/result.dart';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class FirebaseAuthentication implements Authentication {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  FirebaseAuthentication({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  @override
  String? getLoggedInUserId() {
    // TODO: implement getLoggedInUserId
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> login(
      {required String email, required String password}) async {
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return Result.success(userCredential.user!.uid);
    } on firebase_auth.FirebaseException catch (e) {
      return Result.failed(e.message!);
    }
  }

  @override
  Future<Result<void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> register(
      {required String email, required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
