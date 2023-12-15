import 'package:uplace/backend/application/dtos/testDto.dart';
import 'package:uplace/backend/application/services/interfaces/baseServiceInterface.dart';
import 'package:uplace/backend/repository/implementations/firestore/tests2FSRepository.dart';
import 'package:uplace/backend/repository/implementations/firestore/testsFSRepository.dart';
import 'package:uplace/backend/repository/interfaces/testsRepositoryInterface.dart';

class TestService extends BaseServiceInterface {
  late TestsRepositoryInterface testsRepository;
  int system = 1;

  TestService() {
    if (system == 0) {
      testsRepository = TestsFSRepository();
    } else {
      testsRepository = Tests2FSRepository();
    }
  }

  Future<List<TestDTO>?> getAll() async {
    var tests = await testsRepository.getAll();
    var testsDTO = tests?.map((e) => TestDTO.fromTest(e)).toList();
    return testsDTO;
  }
}
