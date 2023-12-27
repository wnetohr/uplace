import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uplace/backend/repository/interfaces/testsRepositoryInterface.dart';
import 'package:uplace/backend/repository/models/test.dart';

class Tests2FSRepository extends TestsRepositoryInterface {
  late CollectionReference db;
  static final Tests2FSRepository _firestoreProfileRepository =
      Tests2FSRepository._internal();

  @override
  void configure() {
    if (!configured) {
      db = FirebaseFirestore.instance.collection("tests2");
      configured = true;
    }
  }

  Tests2FSRepository._internal();
  factory Tests2FSRepository() {
    _firestoreProfileRepository.configure();
    return _firestoreProfileRepository;
  }

  @override
  Future<List<Test>?> getAll() async {
    QuerySnapshot testsQuery = await db.get();
    List<Test> tests = testsQuery.docs
        .map((e) => Test.fSTests2(e.data() as Map<String, dynamic>, e.id))
        .toList();
    return tests;
  }
}
