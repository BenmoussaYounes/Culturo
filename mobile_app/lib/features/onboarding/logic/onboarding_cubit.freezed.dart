// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingState()';
}


}

/// @nodoc
class $OnboardingStateCopyWith<$Res>  {
$OnboardingStateCopyWith(OnboardingState _, $Res Function(OnboardingState) __);
}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( NavigateToSignInPage value)?  navigateToSignInPage,TResult Function( NavigateToSignUpPage value)?  navigateToSignUpPage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case NavigateToSignInPage() when navigateToSignInPage != null:
return navigateToSignInPage(_that);case NavigateToSignUpPage() when navigateToSignUpPage != null:
return navigateToSignUpPage(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( NavigateToSignInPage value)  navigateToSignInPage,required TResult Function( NavigateToSignUpPage value)  navigateToSignUpPage,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case NavigateToSignInPage():
return navigateToSignInPage(_that);case NavigateToSignUpPage():
return navigateToSignUpPage(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( NavigateToSignInPage value)?  navigateToSignInPage,TResult? Function( NavigateToSignUpPage value)?  navigateToSignUpPage,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case NavigateToSignInPage() when navigateToSignInPage != null:
return navigateToSignInPage(_that);case NavigateToSignUpPage() when navigateToSignUpPage != null:
return navigateToSignUpPage(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  navigateToSignInPage,TResult Function()?  navigateToSignUpPage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case NavigateToSignInPage() when navigateToSignInPage != null:
return navigateToSignInPage();case NavigateToSignUpPage() when navigateToSignUpPage != null:
return navigateToSignUpPage();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  navigateToSignInPage,required TResult Function()  navigateToSignUpPage,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case NavigateToSignInPage():
return navigateToSignInPage();case NavigateToSignUpPage():
return navigateToSignUpPage();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  navigateToSignInPage,TResult? Function()?  navigateToSignUpPage,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case NavigateToSignInPage() when navigateToSignInPage != null:
return navigateToSignInPage();case NavigateToSignUpPage() when navigateToSignUpPage != null:
return navigateToSignUpPage();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements OnboardingState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingState.initial()';
}


}




/// @nodoc


class NavigateToSignInPage implements OnboardingState {
  const NavigateToSignInPage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigateToSignInPage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingState.navigateToSignInPage()';
}


}




/// @nodoc


class NavigateToSignUpPage implements OnboardingState {
  const NavigateToSignUpPage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigateToSignUpPage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingState.navigateToSignUpPage()';
}


}




// dart format on
