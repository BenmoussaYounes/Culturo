sealed class ActionState<T> {
  const ActionState();

  R when<R>({
    required R Function() idle,
    required R Function() processing,
    required R Function(T data) success,
    required R Function(String message) failure,
  }) {
    return switch (this) {
      Idle<T>() => idle(),
      Processing<T>() => processing(),
      Success<T> s => success(s.data),
      Failure<T> s => failure(s.message),
    };
  }

  R maybeWhen<R>({
    R Function()? idle,
    R Function()? processing,
    R Function(T data)? success,
    R Function(String message)? failure,
    required R Function() orElse,
  }) {
    return switch (this) {
      Idle<T>() => idle?.call() ?? orElse(),
      Processing<T>() => processing?.call() ?? orElse(),
      Success<T> s => success?.call(s.data) ?? orElse(),
      Failure<T> s => failure?.call(s.message) ?? orElse(),
    };
  }

  R? whenOrNull<R>({
    R Function()? idle,
    R Function()? processing,
    R Function(T data)? success,
    R Function(String message)? failure,
  }) {
    return switch (this) {
      Idle<T>() => idle?.call(),
      Processing<T>() => processing?.call(),
      Success<T> s => success?.call(s.data),
      Failure<T> s => failure?.call(s.message),
    };
  }
}

final class Idle<T> extends ActionState<T> {
  const Idle();
}

final class Processing<T> extends ActionState<T> {
  const Processing();
}

final class Success<T> extends ActionState<T> {
  const Success(this.data);
  final T data;
}

final class Failure<T> extends ActionState<T> {
  const Failure(this.message);
  final String message;
}
