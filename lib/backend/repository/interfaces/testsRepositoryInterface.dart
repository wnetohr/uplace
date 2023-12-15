import 'package:uplace/backend/repository/models/test.dart';

abstract class TestsRepositoryInterface {
  bool configured = false;

  void configure() {}
  Future<List<Test>?> getAll();
}
