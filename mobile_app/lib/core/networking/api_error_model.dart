import 'api_constants.dart';

class ApiErrorModel {
  final String message;
  final int? code;
  final ApiErrorType type;

  ApiErrorModel({required this.message, this.code, required this.type});
}
