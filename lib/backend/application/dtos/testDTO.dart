import 'package:uplace/backend/repository/models/test.dart';

class TestDTO {
  String completeName;

  TestDTO({required this.completeName});

  factory TestDTO.fromTest(Test test) {
    return TestDTO(completeName: "${test.name} - ${test.date}, ${test.qtd}");
  }
}
