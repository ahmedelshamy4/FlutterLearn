class ServerException implements Exception {
  String? error;
  ServerException(this.error);
}

class CancelRequestException implements Exception {}
class UnauthorizedException implements Exception {}

class EmptyCacheException implements Exception {}

class OfflineException implements Exception {}
