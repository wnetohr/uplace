import 'package:firebase_auth/firebase_auth.dart';
import 'package:uplace/backend/repository/interfaces/baseRepository.dart';

abstract class AuthRepositoryInterface extends BaseRepository {
  Future<UserCredential?> firebaseEmailSignUp(String email, String password);
}