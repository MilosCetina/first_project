class InvalidEmailException implements Exception {
  final String failedValue;

  InvalidEmailException({required this.failedValue});
}

class ServerException implements Exception {
  String? message;

  ServerException(this.message);
}

