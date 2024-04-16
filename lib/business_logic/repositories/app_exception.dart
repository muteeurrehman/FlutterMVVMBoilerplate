import 'package:flutter_app_starter/business_logic/enums/error_enums.dart';

class AppException implements Exception {
  final AppError error;

  AppException(this.error);

  String get _message => error.message;
  String get _prefix => error.prefix;

  @override
  String toString() => '$_prefix$_message';
}

class BadRequestException extends AppException {
  BadRequestException(String message)
      : super(AppError.communicationToServerFailed);
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String message)
      : super(AppError.communicationToServerFailed);
}

class InvalidInputException extends AppException {
  InvalidInputException(String message)
      : super(AppError.communicationToServerFailed);
}

class FetchDataException extends AppException {
  FetchDataException(String message) : super(AppError.communicationToServerFailed);
}
