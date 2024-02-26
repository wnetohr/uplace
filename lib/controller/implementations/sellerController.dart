import 'package:uplace/application/services/implementations/sellerService.dart';
import 'package:uplace/controller/baseController.dart';
import 'package:uplace/controller/handling/response.dart';

class SellerController extends BaseController {
  final SellerService _sellerService = SellerService();

  SellerController();

  Future<Response> getFoodCards() async {
    var validate = await validateLogedUser();
    if (!validate) {
      return awnser(null);
    }
    return awnser(await _sellerService.getFoodCards());
  }

  Future<Response> getProductCards() async {
    var validate = await validateLogedUser();
    if (!validate) {
      return awnser(null);
    }
    return awnser(await _sellerService.getProductCards());
  }

  Future<Response> getServiceCards() async {
    var validate = await validateLogedUser();
    if (!validate) {
      return awnser(null);
    }
    return awnser(await _sellerService.getServiceCards());
  }
}
