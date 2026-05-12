import 'api_error_model.dart';

sealed class ApiResult<T> {
  const ApiResult();
}

final class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  const ApiSuccess(this.data);
}

final class ApiFailure<T> extends ApiResult<T> {
  final ApiErrorModel error;
  const ApiFailure(this.error);
}

extension ApiResultX<T> on ApiResult<T> {
  void when({required void Function(T data) success, required void Function(ApiErrorModel error) failure}) {
    switch (this) {
      case ApiSuccess(:final data):
        success(data);
      case ApiFailure(:final error):
        failure(error);
    }
  }

  R map<R>({required R Function(T data) success, required R Function(ApiErrorModel error) failure}) {
    return switch (this) {
      ApiSuccess(:final data) => success(data),
      ApiFailure(:final error) => failure(error),
    };
  }
}
