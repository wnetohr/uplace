import 'package:uplace/application/services/interfaces/baseService.dart';
import 'package:uplace/models/consumer.dart';
import 'package:uplace/repository/implementations/authentication/firebaseAuthRepository.dart';
import 'package:uplace/repository/implementations/firestore/consumerFSRepository.dart';
import 'package:uplace/repository/interfaces/authRepositoryInterface.dart';
import 'package:uplace/repository/interfaces/consumerRepositoryInterface.dart';

class ConsumerService extends BaseService {
  final AuthRepositoryInterface _firebaseAuthRepository =
      FirebaseAuthRepository();
  final ConsumerRepositoryInterface _consumerFSRepository =
      ConsumerFSRepository();

  ConsumerService();

  Future<Consumer?> getConsumer() async {
    var authUser = _firebaseAuthRepository.getUser();
    if (authUser == null) {
      setError("Não foi possivel obter o usuario");
      return null;
    }

    var consumer = await _consumerFSRepository.getConsumerById(authUser.uid);
    if (consumer == null) {
      setError("Não foi possivel obter o seu perfil");
      return null;
    }

    return consumer;
  }
}
