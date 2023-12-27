import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepositoryInterface {
  Future<UserCredential?> firebaseEmailSignUp(String email, String password);
}
