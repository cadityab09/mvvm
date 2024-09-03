class AppException implements Exception{
  final _msg;
  final _prefix;

  AppException([this._msg, this._prefix]);

  String toString(){
    return '$_prefix : $_msg';
  }
}

class FetchDataException extends AppException{
  FetchDataException([String? message]) : super(message, 'Error during cummunication');
}

class BadRequestException extends AppException{
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

class UnauthorisedException extends AppException{
  UnauthorisedException([String? message]) : super(message, 'Unauthorised Request');
}

class InvalidInputException extends AppException{
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}
