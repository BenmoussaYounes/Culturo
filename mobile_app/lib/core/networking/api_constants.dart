class ApiConstants {
  static const String baseUrl = "https://culturo-backend.onrender.com/";

  static const String siginIn = "auth/signin";
  static const String signup = "auth/signup";
}

enum ApiErrorType {
  badRequest("Bad request", 400),
  noContent("No content", 204),
  forbidden("Forbidden", 403),
  unauthorized("Unauthorized", 401),
  notFound("Not found", 404),
  conflict("Conflict", 409),
  internalServer("Internal server error", 500),
  timeout("Timeout", 408),
  noInternet("No internet", 0),
  cacheError("Cache error", 0),
  unknown("Unknown error", -1),
  defaultError("Default error", -1);

  const ApiErrorType(this.message, this.code);
  final String message;
  final int code;

  static ApiErrorType fromStatusCode(int statusCode) {
    return ApiErrorType.values.firstWhere((e) => e.code == statusCode, orElse: () => ApiErrorType.unknown);
  }
}
