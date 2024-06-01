import 'package:dio/dio.dart';

class TimeOutException extends DioException {
  TimeOutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
