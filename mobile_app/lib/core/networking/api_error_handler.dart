import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection to server failed", type: ApiErrorType.noInternet);
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request to the server was cancelled", type: ApiErrorType.unknown);
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection timeout with the server", type: ApiErrorType.timeout);
        case DioExceptionType.unknown:
          return ApiErrorModel(
            message: "Connection to the server failed due to internet connection",
            type: ApiErrorType.unknown,
          );
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: "Receive timeout in connection with the server", type: ApiErrorType.timeout);
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: "Send timeout in connection with the server", type: ApiErrorType.timeout);
        default:
          return ApiErrorModel(message: "Something went wrong", type: ApiErrorType.unknown);
      }
    } else {
      return ApiErrorModel(message: "Unknown error occurred", type: ApiErrorType.unknown);
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel(
    message: data['message'] ?? "Unknown error occurred",
    code: data['code'],
    type: ApiErrorType.fromStatusCode(data['code']),
  );
}
