import 'package:dio/dio.dart';

class DioErrorUtil {
  // general methods:------------------------------------------------------------
  static String handleError(DioException error) {
    print('check dio Exception error type ${error.type} ');
    print('check dio Exception error type ${error.type} ');
    String errorDescription = "";
    switch (error.type) {
    // case DioExceptionType.re:
    //   errorDescription = "Request to API server was cancelled.";
    //   break;
      case DioExceptionType.cancel:
        errorDescription = "Request to API server was cancelled.";
        break;
      case DioExceptionType.unknown:
        errorDescription = "Unknown error with API server";
        break;

      case DioExceptionType.connectionTimeout:
        errorDescription = "Connection timeout with API server.";
        break;
      case DioExceptionType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server.";
        break;
      case DioExceptionType.badResponse:
        errorDescription = error.response?.data['message'];
        break;
      case DioExceptionType.sendTimeout:
        errorDescription = "Send timeout in connection with API server.";
        break;
      case DioExceptionType.connectionError:
        errorDescription = "Connection error with API server.";
        break;
      default:
        errorDescription = "Unknown error with API server.";
        break;
    }
    return errorDescription;
  }
}
