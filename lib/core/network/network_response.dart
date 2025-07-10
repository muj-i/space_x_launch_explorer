class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final List body;

  const NetworkResponse(
    this.isSuccess,
    this.statusCode,
    this.body,
  );
}
