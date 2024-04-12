import 'dart:io';

class ServerException extends HttpException {
  final String message;

  ServerException({this.message = "Server error occured"}) : super('');
}
