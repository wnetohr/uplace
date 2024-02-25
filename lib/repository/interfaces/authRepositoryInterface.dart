import 'package:firebase_auth/firebase_auth.dart';
import 'package:uplace/repository/interfaces/baseRepository.dart';

abstract class AuthRepositoryInterface extends BaseRepository {
  Future<UserCredential?> firebaseEmailSignUp(String email, String password);
  Future<UserCredential?> firebaseEmailLogin(String email, String password);
  User? getUser();
  void signOut();
}
