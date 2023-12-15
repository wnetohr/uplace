import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uplace/backend/repository/interfaces/testsRepositoryInterface.dart';
import 'package:uplace/backend/repository/models/test.dart';

class TestsFSRepository extends TestsRepositoryInterface {
  late CollectionReference db;
  static final TestsFSRepository _firestoreProfileRepository =
      TestsFSRepository._internal();

  @override
  void configure() {
    if (!configured) {
      db = FirebaseFirestore.instance.collection("tests");
      configured = true;
    }
  }

  TestsFSRepository._internal();
  factory TestsFSRepository() {
    _firestoreProfileRepository.configure();
    return _firestoreProfileRepository;
  }

  @override
  Future<List<Test>?> getAll() async {
    QuerySnapshot testsQuery = await db.get();
    List<Test> tests = testsQuery.docs
        .map((e) => Test.fSTests(e.data() as Map<String, dynamic>, e.id))
        .toList();
    return tests;
  }
}
