import 'package:uplace/backend/handling/errorHandler.dart';

abstract class BaseService {
  final ErrorHandler _errorHandler = ErrorHandler();

  void setError(String error) {
    _errorHandler.setError(error);
  }
}
