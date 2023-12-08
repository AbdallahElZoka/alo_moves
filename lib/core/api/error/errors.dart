class ServerErrorException implements Exception {
  String errorMessage;
  int httpResponseCode;

  ServerErrorException(
      {required this.errorMessage, required this.httpResponseCode});
}

class NetworkException implements Exception {
  String message;

  NetworkException(this.message);
}
