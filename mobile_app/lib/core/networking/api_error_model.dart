import 'api_constants.dart';

class ApiErrorModel {
  final String message;
  final int? code;
  final ApiErrorType type;

  ApiErrorModel({required this.message, this.code, required this.type});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    if (json['message'] == null) {
      return ApiErrorModel(message: 'Unknown error', code: -1, type: ApiErrorType.unknown);
    }

    return ApiErrorModel(message: json['message'], code: json['code'], type: ApiErrorType.fromStatusCode(json['code']));
  }
}
