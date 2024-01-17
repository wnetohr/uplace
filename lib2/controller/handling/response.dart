class Response {
  final bool isValid;
  final String? error;
  final dynamic data;

  Response._(this.isValid, this.error, this.data);

  factory Response.success(dynamic data) {
    return Response._(true, null, data);
  }

  factory Response.error(String error) {
    return Response._(false, error, null);
  }
}
