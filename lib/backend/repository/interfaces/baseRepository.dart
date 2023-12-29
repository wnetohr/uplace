import 'package:uplace/backend/handling/errorHandler.dart';

abstract class BaseRepository {
  final ErrorHandler _errorHandler = ErrorHandler();
  bool configured = false;

  void setError(String error) {
    _errorHandler.setError(error);
  }

  void configure();
}
