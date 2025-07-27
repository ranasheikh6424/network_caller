class NetworkResponse {
  final bool isSuccess;
  final dynamic data;
  final String? errorMessage;
  final int statusCode;

  NetworkResponse({
    required this.isSuccess,
    this.data,
    this.errorMessage,
    required this.statusCode,
  });
}
