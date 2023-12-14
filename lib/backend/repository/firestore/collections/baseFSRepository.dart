import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseFSRepository {
  bool _configured = false;
  late CollectionReference db;

  CollectionReference configure(String collection) {
    if (!_configured) {
      _configured = true;
      db = FirebaseFirestore.instance.collection(collection);
    }

    return db;
  }
}
