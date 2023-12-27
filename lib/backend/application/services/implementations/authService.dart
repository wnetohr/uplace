import 'package:firebase_auth/firebase_auth.dart';
import 'package:uplace/backend/application/dtos/newUserDto.dart';
import 'package:uplace/backend/application/services/interfaces/baseService.dart';
import 'package:uplace/backend/repository/implementations/authentication/firebaseAuthRepository.dart';
import 'package:uplace/backend/repository/implementations/firestore/consumerFSRepository.dart';
import 'package:uplace/backend/repository/interfaces/authRepositoryInterface.dart';
import 'package:uplace/backend/repository/interfaces/consumerRepositoryInterface.dart';

class AuthService extends BaseService {
  final AuthRepositoryInterface _firebaseAuthRepository =
      FirebaseAuthRepository();
  final ConsumerRepositoryInterface _userFSRepository = ConsumerFSRepository();

  AuthService();

  void emailSignUp(NewUserDTO newUser) async {
    if (newUser.password != newUser.confirmPassword) {
      print("As senhas nao correspondem");
      return;
    }
    if (newUser.password.length < 6) {
      print("A senha deve conter ao menos 6 caracteres");
      return;
    }

    UserCredential? user;
    try {
      user = await _firebaseAuthRepository.firebaseEmailSignUp(
          newUser.email, newUser.password);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          print("Este email nao e valido para criar uma conta");
          return null;
        case "email-already-in-use":
          print("Este email ja esta em uso");
          return null;
        default:
          print("Ocorreu um erro ao criar sua conta");
          return null;
      }
    } catch (error) {
      print("Ocorreu um erro desconhecido ao criar a conta");
      return null;
    }

    if (user == null || user.user == null) {
      print("Nao foi possivel criar seu usuario");
      return;
    }

    String consumerId = user.user!.uid;
    await _userFSRepository.createConsumer(
      newUser.name,
      newUser.birthDate,
      consumerId,
    );
    var consumer = await _userFSRepository.getConsumerById(consumerId);

    if (consumer == null) {
      // TODO: remover de firebase auth
      print("Nao foi possivel vincular seu usuario ao sistema");
      return;
    }
    print(consumer);
    // TODO: Revisar retorno dos services
    // return consumer;
  }
}
