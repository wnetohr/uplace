class ErrorHandler {
  final List<String> _errors = List<String>.empty(growable: true);

  static final ErrorHandler _errorHandler = ErrorHandler._internal();
  ErrorHandler._internal();
  factory ErrorHandler() => _errorHandler;

  String? validateError() {
    if (_errors.isEmpty) {
      return null;
    }
    var lastError = _errors.last;
    _errors.clear();
    return lastError;
  }

  void setError(String error) {
    _errors.add(error);
  }
}
