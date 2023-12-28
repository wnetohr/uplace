class ErrorHandler {
  final List<String> _errors = List<String>.empty(growable: true);

  static final ErrorHandler _firestoreUserRepository = ErrorHandler._internal();
  ErrorHandler._internal();
  factory ErrorHandler() => _firestoreUserRepository;

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
