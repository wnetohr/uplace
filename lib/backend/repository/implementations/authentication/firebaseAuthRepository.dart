import 'package:uplace/backend/repository/interfaces/authRepositoryInterface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository extends AuthRepositoryInterface {
  bool _configured = false;
  late FirebaseAuth _db;

  static final FirebaseAuthRepository _firebaseAuthRepository =
      FirebaseAuthRepository._internal();

  factory FirebaseAuthRepository() {
    _firebaseAuthRepository.configure();
    return _firebaseAuthRepository;
  }

  FirebaseAuthRepository._internal();

  void configure() {
    if (!_configured) {
      _configured = true;
      _db = FirebaseAuth.instance;
    }
  }

  @override
  Future<UserCredential?> firebaseEmailSignUp(
      String email, String password) async {
    var user = await _db.createUserWithEmailAndPassword(
        email: email, password: password);
    return user;
  }
}
