sealed class BaseState<T> {
  const BaseState();

  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(T data) loaded,
    required R Function(String message) error,
  }) {
    return switch (this) {
      Initial<T>() => initial(),
      Loading<T>() => loading(),
      Loaded<T> s => loaded(s.data),
      Failure<T> s => error(s.message),
    };
  }

  R maybeWhen<R>({
    R Function()? initial,
    R Function()? loading,
    R Function(T data)? loaded,
    R Function(String message)? error,
    required R Function() orElse,
  }) {
    return switch (this) {
      Initial<T>() => initial?.call() ?? orElse(),
      Loading<T>() => loading?.call() ?? orElse(),
      Loaded<T> s => loaded?.call(s.data) ?? orElse(),
      Failure<T> s => error?.call(s.message) ?? orElse(),
    };
  }

  R? whenOrNull<R>({
    R Function()? initial,
    R Function()? loading,
    R Function(T data)? loaded,
    R Function(String message)? error,
  }) {
    return switch (this) {
      Initial<T>() => initial?.call(),
      Loading<T>() => loading?.call(),
      Loaded<T> s => loaded?.call(s.data),
      Failure<T> s => error?.call(s.message),
    };
  }
}

final class Initial<T> extends BaseState<T> {
  const Initial();
}

final class Loading<T> extends BaseState<T> {
  const Loading();
}

final class Loaded<T> extends BaseState<T> {
  const Loaded(this.data);
  final T data;
}

final class Failure<T> extends BaseState<T> {
  const Failure(this.message);
  final String message;
}
