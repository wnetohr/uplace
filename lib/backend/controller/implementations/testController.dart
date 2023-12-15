import 'package:uplace/backend/application/dtos/testDto.dart';
import 'package:uplace/backend/application/services/implementations/testService.dart';
import 'package:uplace/backend/controller/interfaces/baseController.dart';

class TestController extends BaseController {
  final TestService _testService = TestService();

  TestController();

  Future<List<TestDTO>?> getAll() async {
    return await _testService.getAll();
  }
}
