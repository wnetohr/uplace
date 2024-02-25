import 'package:uplace/application/services/implementations/consumerService.dart';
import 'package:uplace/controller/baseController.dart';
import 'package:uplace/controller/handling/response.dart';

class ConsumerController extends BaseController {
  final ConsumerService _consumerService = ConsumerService();

  ConsumerController();

  Future<Response> getConsumer() async {
    validateLogedUser();
    return awnser(await _consumerService.getConsumer());
  }
}
