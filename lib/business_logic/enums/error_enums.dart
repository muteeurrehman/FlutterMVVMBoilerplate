import 'package:flutter_app_starter/business_logic/misc/error_messages.dart';

enum AppError {
  networkFailure,
  communicationToServerFailed,
  unknow,
}

extension AppErrorExtension on AppError {
  String get message {
    switch (this) {
      case AppError.networkFailure:
        return ExceptionMessages.networkFailed;
      case AppError.communicationToServerFailed:
        return ExceptionMessages.communicationWithServerFailed;
      default:
        return ExceptionMessages.unknow;
    }
  }

  String get prefix {
    switch (this) {
      case AppError.networkFailure:
        return 'Network: ';
      default:
        return '';
    }
  }
}
