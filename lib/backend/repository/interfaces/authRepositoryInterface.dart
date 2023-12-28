import 'package:firebase_auth/firebase_auth.dart';
import 'package:uplace/backend/handling/errorHandler.dart';

abstract class AuthRepositoryInterface {
  final ErrorHandler _errorHandler = ErrorHandler();

  void setError(String error) {
    _errorHandler.setError(error);
  }

  Future<UserCredential?> firebaseEmailSignUp(String email, String password);
}
