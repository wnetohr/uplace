import 'package:firebase_auth/firebase_auth.dart';
import 'package:uplace/repository/interfaces/authRepositoryInterface.dart';

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
    String email,
    String password,
  ) async {
    try {
      var user = await _db.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          setError("Este email não é valido para criar uma conta");
          return null;
        case "email-already-in-use":
          setError("Este email já esta em uso");
          return null;
        default:
          setError("Ocorreu um erro ao criar sua conta");
          return null;
      }
    } catch (error) {
      setError("Ocorreu um erro desconhecido ao criar a conta");
      return null;
    }
  }

  @override
  Future<UserCredential?> firebaseEmailLogin(
    String email,
    String password,
  ) async {
    try {
      var user = await _db.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          setError("Email de usuário invalido");
          return null;
        case "user-not-found":
          setError("Esse usuário não existe");
          return null;
        case "wrong-password":
          setError("Não existe um usuário com essas credenciais");
          return null;
        default:
          setError("Ocorreu um erro ao acessar sua conta");
          return null;
      }
    } catch (error) {
      setError("Ocorreu um erro desconhecido ao acessar sua conta");
      return null;
    }
  }

  @override
  User? getUser() {
    var userAuth = _db.currentUser;
    return userAuth;
  }

  @override
  Future<void> signOut() async {
    await _db.signOut();
  }

  // void firebaseEmailDelete() async {
  //   try {
  //     await FirebaseAuth.instance.currentUser!.delete();
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == "requires-recent-login") {
  //     } else {
  //     }
  //   } catch (e) {
  //   }
  // }
}
