class ApiConstants {
  static const String baseUrl = "https://culturo-backend-g5n9.onrender.com/api/";
  static const String battleSocketUrl = "https://culturo-backend-g5n9.onrender.com/battle";

  static const String siginIn = "auth/signin";
  static const String forgotPassword = "auth/forgot-password";
  static const String signup = "auth/signup";
  static const String verifyEmail = "auth/signup-otp";
  static const String signUpOtp = "auth/signup-otp";

  static const String category = "category/";
  static const String usersGetMe = "/users/getme";

  static const String gameSessionStart = "game/session/start";
  static const String gameSessionAnswer = "game/session/answer";
  static const String gameSessionComplete = "game/session/complete";

  static const String leaderboard = "progression/leaderboard";
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
