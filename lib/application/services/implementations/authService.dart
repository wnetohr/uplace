import 'package:firebase_auth/firebase_auth.dart';
import 'package:uplace/application/dtos/newUserDTO.dart';
import 'package:uplace/application/services/interfaces/baseService.dart';
import 'package:uplace/models/consumer.dart';
import 'package:uplace/repository/implementations/authentication/firebaseAuthRepository.dart';
import 'package:uplace/repository/implementations/firestore/bannedUsersFSRepository.dart';
import 'package:uplace/repository/implementations/firestore/consumerFSRepository.dart';
import 'package:uplace/repository/interfaces/authRepositoryInterface.dart';
import 'package:uplace/repository/interfaces/bannedUsersRepositoryInterface.dart';
import 'package:uplace/repository/interfaces/consumerRepositoryInterface.dart';

class AuthService extends BaseService {
  final AuthRepositoryInterface _firebaseAuthRepository =
      FirebaseAuthRepository();
  final ConsumerRepositoryInterface _consumerFSRepository =
      ConsumerFSRepository();
  final BannedUsersRepositoryInterface _bannedUsersRepository =
      BannedUsersFSRepository();

  AuthService();

  Future<Consumer?> emailSignUp(NewUserDTO newUser) async {
    if (newUser.password != newUser.confirmPassword) {
      setError("As senhas não correspondem");
      return null;
    }
    if (newUser.password.length < 6) {
      setError("A senha deve conter ao menos 6 caracteres");
      return null;
    }

    var bannedUsers = await _bannedUsersRepository.getBannedUsers();
    if (bannedUsers != null &&
        bannedUsers.isNotEmpty &&
        bannedUsers.any((e) => e.email == newUser.email)) {
      setError("Usuario banido");
      return null;
    }

    UserCredential? authUser =
        await _firebaseAuthRepository.firebaseEmailSignUp(
      newUser.email,
      newUser.password,
    );
    if (authUser == null || authUser.user == null) {
      return null;
    }

    String consumerId = authUser.user!.uid;
    bool createdConsumer = await _consumerFSRepository.createConsumer(
      newUser.name,
      newUser.birthDate,
      newUser.email,
      consumerId,
    );

    if (!createdConsumer) {
      await _firebaseAuthRepository.signOut();
      // TODO: deletar usuario
      setError("Nao foi possivel vincular seu usuario ao sistema");
      return null;
    }
    var consumer = await _consumerFSRepository.getConsumerById(consumerId);

    return consumer;
  }

  Future<Consumer?> emailLogin(String email, String password) async {
    var bannedUsers = await _bannedUsersRepository.getBannedUsers();
    if (bannedUsers != null &&
        bannedUsers.isNotEmpty &&
        bannedUsers.any((e) => e.email == email)) {
      setError("Usuario banido");
      return null;
    }
    var authUser =
        await _firebaseAuthRepository.firebaseEmailLogin(email, password);

    if (authUser == null || authUser.user == null) {
      return null;
    }
    var user = authUser.user!;

    var consumer = await _consumerFSRepository.getConsumerById(user.uid);
    if (consumer == null) {
      setError("Usuário não encontrado");
      return null;
    }

    return consumer;
  }

  Future<bool> signOut() async {
    await _firebaseAuthRepository.signOut();
    var user = _firebaseAuthRepository.getUser();
    return user == null;
  }
}
