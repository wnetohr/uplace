import 'package:uplace/controller/handling/errorHandler.dart';
import 'package:uplace/controller/handling/response.dart';

class BaseController {
  final ErrorHandler _errorHandler = ErrorHandler();

  BaseController();

  Response awnser(data) {
    String? error = _errorHandler.validateError();
    if (error != null) {
      return Response.error(error);
    }
    return Response.success(data);
  }
}
