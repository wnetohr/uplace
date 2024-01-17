import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uplace/backend/repository/interfaces/consumerRepositoryInterface.dart';
import 'package:uplace/backend/repository/models/consumer.dart';

class ConsumerFSRepository extends ConsumerRepositoryInterface {
  late CollectionReference db;
  static final ConsumerFSRepository _firestoreUserRepository =
      ConsumerFSRepository._internal();

  @override
  void configure() {
    if (!configured) {
      db = FirebaseFirestore.instance.collection("consumers");
      configured = true;
    }
  }

  ConsumerFSRepository._internal();
  factory ConsumerFSRepository() {
    _firestoreUserRepository.configure();
    return _firestoreUserRepository;
  }

  @override
  Future<bool> createConsumer(
      String name, DateTime birthDate, String userUID) async {
    var user = <String, dynamic>{
      "name": name,
      "birthDate": birthDate,
    };
    return await db
        .doc(userUID)
        .set(user)
        .then((value) => true, onError: (error) => false);
  }

  @override
  Future<Consumer?> getConsumerById(consumerId) async {
    var consumer = await db.doc(consumerId).get();
    if (consumer.exists) {
      return Consumer.FromFirebase(
          consumer.data()! as Map<String, dynamic>, consumerId);
    }

    return null;
  }
}
