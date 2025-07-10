class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final List responseData;

  const NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    required this.responseData,
  });
}
