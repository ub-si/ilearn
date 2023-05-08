class ApiResult<T> {
  T? data;
  String? message;
  bool isError;

  ApiResult({
    this.data,
    this.message,
    this.isError = false,
  });
}
