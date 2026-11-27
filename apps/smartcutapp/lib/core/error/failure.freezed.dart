// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {

 String get message;
/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this as Failure, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Failure;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.message, _this.message) || other.message == _this.message));
}


@override
int get hashCode {
  final _this = this as Failure;
  return Object.hash(runtimeType,_this.message);
}

@override
String toString() {
  final _this = this as Failure;
  return 'Failure(message: ${_this.message})';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res>  {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NetworkFailure value)?  network,TResult Function( TimeoutFailure value)?  timeout,TResult Function( CancelledFailure value)?  cancelled,TResult Function( CertificateFailure value)?  certificate,TResult Function( ValidationFailure value)?  validation,TResult Function( UnauthorizedFailure value)?  unauthorized,TResult Function( ForbiddenFailure value)?  forbidden,TResult Function( NotFoundFailure value)?  notFound,TResult Function( ConflictFailure value)?  conflict,TResult Function( RateLimitFailure value)?  rateLimit,TResult Function( ServerFailure value)?  server,TResult Function( UnknownFailure value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network(_that);case TimeoutFailure() when timeout != null:
return timeout(_that);case CancelledFailure() when cancelled != null:
return cancelled(_that);case CertificateFailure() when certificate != null:
return certificate(_that);case ValidationFailure() when validation != null:
return validation(_that);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case ForbiddenFailure() when forbidden != null:
return forbidden(_that);case NotFoundFailure() when notFound != null:
return notFound(_that);case ConflictFailure() when conflict != null:
return conflict(_that);case RateLimitFailure() when rateLimit != null:
return rateLimit(_that);case ServerFailure() when server != null:
return server(_that);case UnknownFailure() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NetworkFailure value)  network,required TResult Function( TimeoutFailure value)  timeout,required TResult Function( CancelledFailure value)  cancelled,required TResult Function( CertificateFailure value)  certificate,required TResult Function( ValidationFailure value)  validation,required TResult Function( UnauthorizedFailure value)  unauthorized,required TResult Function( ForbiddenFailure value)  forbidden,required TResult Function( NotFoundFailure value)  notFound,required TResult Function( ConflictFailure value)  conflict,required TResult Function( RateLimitFailure value)  rateLimit,required TResult Function( ServerFailure value)  server,required TResult Function( UnknownFailure value)  unknown,}){
final _that = this;
switch (_that) {
case NetworkFailure():
return network(_that);case TimeoutFailure():
return timeout(_that);case CancelledFailure():
return cancelled(_that);case CertificateFailure():
return certificate(_that);case ValidationFailure():
return validation(_that);case UnauthorizedFailure():
return unauthorized(_that);case ForbiddenFailure():
return forbidden(_that);case NotFoundFailure():
return notFound(_that);case ConflictFailure():
return conflict(_that);case RateLimitFailure():
return rateLimit(_that);case ServerFailure():
return server(_that);case UnknownFailure():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NetworkFailure value)?  network,TResult? Function( TimeoutFailure value)?  timeout,TResult? Function( CancelledFailure value)?  cancelled,TResult? Function( CertificateFailure value)?  certificate,TResult? Function( ValidationFailure value)?  validation,TResult? Function( UnauthorizedFailure value)?  unauthorized,TResult? Function( ForbiddenFailure value)?  forbidden,TResult? Function( NotFoundFailure value)?  notFound,TResult? Function( ConflictFailure value)?  conflict,TResult? Function( RateLimitFailure value)?  rateLimit,TResult? Function( ServerFailure value)?  server,TResult? Function( UnknownFailure value)?  unknown,}){
final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network(_that);case TimeoutFailure() when timeout != null:
return timeout(_that);case CancelledFailure() when cancelled != null:
return cancelled(_that);case CertificateFailure() when certificate != null:
return certificate(_that);case ValidationFailure() when validation != null:
return validation(_that);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case ForbiddenFailure() when forbidden != null:
return forbidden(_that);case NotFoundFailure() when notFound != null:
return notFound(_that);case ConflictFailure() when conflict != null:
return conflict(_that);case RateLimitFailure() when rateLimit != null:
return rateLimit(_that);case ServerFailure() when server != null:
return server(_that);case UnknownFailure() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  network,TResult Function( String message)?  timeout,TResult Function( String message)?  cancelled,TResult Function( String message)?  certificate,TResult Function( String message,  int? statusCode,  dynamic data,  Map<String, dynamic>? errors)?  validation,TResult Function( String message,  int? statusCode,  dynamic data)?  unauthorized,TResult Function( String message,  int? statusCode,  dynamic data)?  forbidden,TResult Function( String message,  int? statusCode,  dynamic data)?  notFound,TResult Function( String message,  int? statusCode,  dynamic data)?  conflict,TResult Function( String message,  int? statusCode,  dynamic data)?  rateLimit,TResult Function( String message,  int? statusCode,  dynamic data)?  server,TResult Function( String message,  int? statusCode,  dynamic data)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network(_that.message);case TimeoutFailure() when timeout != null:
return timeout(_that.message);case CancelledFailure() when cancelled != null:
return cancelled(_that.message);case CertificateFailure() when certificate != null:
return certificate(_that.message);case ValidationFailure() when validation != null:
return validation(_that.message,_that.statusCode,_that.data,_that.errors);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that.message,_that.statusCode,_that.data);case ForbiddenFailure() when forbidden != null:
return forbidden(_that.message,_that.statusCode,_that.data);case NotFoundFailure() when notFound != null:
return notFound(_that.message,_that.statusCode,_that.data);case ConflictFailure() when conflict != null:
return conflict(_that.message,_that.statusCode,_that.data);case RateLimitFailure() when rateLimit != null:
return rateLimit(_that.message,_that.statusCode,_that.data);case ServerFailure() when server != null:
return server(_that.message,_that.statusCode,_that.data);case UnknownFailure() when unknown != null:
return unknown(_that.message,_that.statusCode,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  network,required TResult Function( String message)  timeout,required TResult Function( String message)  cancelled,required TResult Function( String message)  certificate,required TResult Function( String message,  int? statusCode,  dynamic data,  Map<String, dynamic>? errors)  validation,required TResult Function( String message,  int? statusCode,  dynamic data)  unauthorized,required TResult Function( String message,  int? statusCode,  dynamic data)  forbidden,required TResult Function( String message,  int? statusCode,  dynamic data)  notFound,required TResult Function( String message,  int? statusCode,  dynamic data)  conflict,required TResult Function( String message,  int? statusCode,  dynamic data)  rateLimit,required TResult Function( String message,  int? statusCode,  dynamic data)  server,required TResult Function( String message,  int? statusCode,  dynamic data)  unknown,}) {final _that = this;
switch (_that) {
case NetworkFailure():
return network(_that.message);case TimeoutFailure():
return timeout(_that.message);case CancelledFailure():
return cancelled(_that.message);case CertificateFailure():
return certificate(_that.message);case ValidationFailure():
return validation(_that.message,_that.statusCode,_that.data,_that.errors);case UnauthorizedFailure():
return unauthorized(_that.message,_that.statusCode,_that.data);case ForbiddenFailure():
return forbidden(_that.message,_that.statusCode,_that.data);case NotFoundFailure():
return notFound(_that.message,_that.statusCode,_that.data);case ConflictFailure():
return conflict(_that.message,_that.statusCode,_that.data);case RateLimitFailure():
return rateLimit(_that.message,_that.statusCode,_that.data);case ServerFailure():
return server(_that.message,_that.statusCode,_that.data);case UnknownFailure():
return unknown(_that.message,_that.statusCode,_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  network,TResult? Function( String message)?  timeout,TResult? Function( String message)?  cancelled,TResult? Function( String message)?  certificate,TResult? Function( String message,  int? statusCode,  dynamic data,  Map<String, dynamic>? errors)?  validation,TResult? Function( String message,  int? statusCode,  dynamic data)?  unauthorized,TResult? Function( String message,  int? statusCode,  dynamic data)?  forbidden,TResult? Function( String message,  int? statusCode,  dynamic data)?  notFound,TResult? Function( String message,  int? statusCode,  dynamic data)?  conflict,TResult? Function( String message,  int? statusCode,  dynamic data)?  rateLimit,TResult? Function( String message,  int? statusCode,  dynamic data)?  server,TResult? Function( String message,  int? statusCode,  dynamic data)?  unknown,}) {final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network(_that.message);case TimeoutFailure() when timeout != null:
return timeout(_that.message);case CancelledFailure() when cancelled != null:
return cancelled(_that.message);case CertificateFailure() when certificate != null:
return certificate(_that.message);case ValidationFailure() when validation != null:
return validation(_that.message,_that.statusCode,_that.data,_that.errors);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that.message,_that.statusCode,_that.data);case ForbiddenFailure() when forbidden != null:
return forbidden(_that.message,_that.statusCode,_that.data);case NotFoundFailure() when notFound != null:
return notFound(_that.message,_that.statusCode,_that.data);case ConflictFailure() when conflict != null:
return conflict(_that.message,_that.statusCode,_that.data);case RateLimitFailure() when rateLimit != null:
return rateLimit(_that.message,_that.statusCode,_that.data);case ServerFailure() when server != null:
return server(_that.message,_that.statusCode,_that.data);case UnknownFailure() when unknown != null:
return unknown(_that.message,_that.statusCode,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class NetworkFailure implements Failure {
  const NetworkFailure({required this.message});
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkFailureCopyWith<NetworkFailure> get copyWith => _$NetworkFailureCopyWithImpl<NetworkFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'Failure.network(message: $message)';
}


}

/// @nodoc
abstract mixin class $NetworkFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $NetworkFailureCopyWith(NetworkFailure value, $Res Function(NetworkFailure) _then) = _$NetworkFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NetworkFailureCopyWithImpl<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  _$NetworkFailureCopyWithImpl(this._self, this._then);

  final NetworkFailure _self;
  final $Res Function(NetworkFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NetworkFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TimeoutFailure implements Failure {
  const TimeoutFailure({required this.message});
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeoutFailureCopyWith<TimeoutFailure> get copyWith => _$TimeoutFailureCopyWithImpl<TimeoutFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeoutFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'Failure.timeout(message: $message)';
}


}

/// @nodoc
abstract mixin class $TimeoutFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $TimeoutFailureCopyWith(TimeoutFailure value, $Res Function(TimeoutFailure) _then) = _$TimeoutFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TimeoutFailureCopyWithImpl<$Res>
    implements $TimeoutFailureCopyWith<$Res> {
  _$TimeoutFailureCopyWithImpl(this._self, this._then);

  final TimeoutFailure _self;
  final $Res Function(TimeoutFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TimeoutFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CancelledFailure implements Failure {
  const CancelledFailure({required this.message});
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancelledFailureCopyWith<CancelledFailure> get copyWith => _$CancelledFailureCopyWithImpl<CancelledFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelledFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'Failure.cancelled(message: $message)';
}


}

/// @nodoc
abstract mixin class $CancelledFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $CancelledFailureCopyWith(CancelledFailure value, $Res Function(CancelledFailure) _then) = _$CancelledFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CancelledFailureCopyWithImpl<$Res>
    implements $CancelledFailureCopyWith<$Res> {
  _$CancelledFailureCopyWithImpl(this._self, this._then);

  final CancelledFailure _self;
  final $Res Function(CancelledFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CancelledFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CertificateFailure implements Failure {
  const CertificateFailure({required this.message});
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CertificateFailureCopyWith<CertificateFailure> get copyWith => _$CertificateFailureCopyWithImpl<CertificateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'Failure.certificate(message: $message)';
}


}

/// @nodoc
abstract mixin class $CertificateFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $CertificateFailureCopyWith(CertificateFailure value, $Res Function(CertificateFailure) _then) = _$CertificateFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CertificateFailureCopyWithImpl<$Res>
    implements $CertificateFailureCopyWith<$Res> {
  _$CertificateFailureCopyWithImpl(this._self, this._then);

  final CertificateFailure _self;
  final $Res Function(CertificateFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CertificateFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ValidationFailure implements Failure {
  const ValidationFailure({required this.message, this.statusCode, this.data,  Map<String, dynamic>? errors}): _errors = errors;
  

@override final  String message;
 final  int? statusCode;
 final  dynamic data;
 final  Map<String, dynamic>? _errors;
 Map<String, dynamic>? get errors {
  final value = _errors;
  if (value == null) return null;
  if (_errors is EqualUnmodifiableMapView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationFailureCopyWith<ValidationFailure> get copyWith => _$ValidationFailureCopyWithImpl<ValidationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&const DeepCollectionEquality().equals(other.data, data)&&const DeepCollectionEquality().equals(other.errors, _errors));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message,statusCode,const DeepCollectionEquality().hash(data),const DeepCollectionEquality().hash(_errors));
}

@override
String toString() {
    return 'Failure.validation(message: $message, statusCode: $statusCode, data: $data, errors: $errors)';
}


}

/// @nodoc
abstract mixin class $ValidationFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ValidationFailureCopyWith(ValidationFailure value, $Res Function(ValidationFailure) _then) = _$ValidationFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, int? statusCode, dynamic data, Map<String, dynamic>? errors
});




}
/// @nodoc
class _$ValidationFailureCopyWithImpl<$Res>
    implements $ValidationFailureCopyWith<$Res> {
  _$ValidationFailureCopyWithImpl(this._self, this._then);

  final ValidationFailure _self;
  final $Res Function(ValidationFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? statusCode = freezed,Object? data = freezed,Object? errors = freezed,}) {
  return _then(ValidationFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,errors: freezed == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

/// @nodoc


class UnauthorizedFailure implements Failure {
  const UnauthorizedFailure({required this.message, this.statusCode, this.data});
  

@override final  String message;
 final  int? statusCode;
 final  dynamic data;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthorizedFailureCopyWith<UnauthorizedFailure> get copyWith => _$UnauthorizedFailureCopyWithImpl<UnauthorizedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UnauthorizedFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message,statusCode,const DeepCollectionEquality().hash(data));
}

@override
String toString() {
    return 'Failure.unauthorized(message: $message, statusCode: $statusCode, data: $data)';
}


}

/// @nodoc
abstract mixin class $UnauthorizedFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnauthorizedFailureCopyWith(UnauthorizedFailure value, $Res Function(UnauthorizedFailure) _then) = _$UnauthorizedFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, int? statusCode, dynamic data
});




}
/// @nodoc
class _$UnauthorizedFailureCopyWithImpl<$Res>
    implements $UnauthorizedFailureCopyWith<$Res> {
  _$UnauthorizedFailureCopyWithImpl(this._self, this._then);

  final UnauthorizedFailure _self;
  final $Res Function(UnauthorizedFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? statusCode = freezed,Object? data = freezed,}) {
  return _then(UnauthorizedFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class ForbiddenFailure implements Failure {
  const ForbiddenFailure({required this.message, this.statusCode, this.data});
  

@override final  String message;
 final  int? statusCode;
 final  dynamic data;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForbiddenFailureCopyWith<ForbiddenFailure> get copyWith => _$ForbiddenFailureCopyWithImpl<ForbiddenFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ForbiddenFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message,statusCode,const DeepCollectionEquality().hash(data));
}

@override
String toString() {
    return 'Failure.forbidden(message: $message, statusCode: $statusCode, data: $data)';
}


}

/// @nodoc
abstract mixin class $ForbiddenFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ForbiddenFailureCopyWith(ForbiddenFailure value, $Res Function(ForbiddenFailure) _then) = _$ForbiddenFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, int? statusCode, dynamic data
});




}
/// @nodoc
class _$ForbiddenFailureCopyWithImpl<$Res>
    implements $ForbiddenFailureCopyWith<$Res> {
  _$ForbiddenFailureCopyWithImpl(this._self, this._then);

  final ForbiddenFailure _self;
  final $Res Function(ForbiddenFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? statusCode = freezed,Object? data = freezed,}) {
  return _then(ForbiddenFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class NotFoundFailure implements Failure {
  const NotFoundFailure({required this.message, this.statusCode, this.data});
  

@override final  String message;
 final  int? statusCode;
 final  dynamic data;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotFoundFailureCopyWith<NotFoundFailure> get copyWith => _$NotFoundFailureCopyWithImpl<NotFoundFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFoundFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message,statusCode,const DeepCollectionEquality().hash(data));
}

@override
String toString() {
    return 'Failure.notFound(message: $message, statusCode: $statusCode, data: $data)';
}


}

/// @nodoc
abstract mixin class $NotFoundFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $NotFoundFailureCopyWith(NotFoundFailure value, $Res Function(NotFoundFailure) _then) = _$NotFoundFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, int? statusCode, dynamic data
});




}
/// @nodoc
class _$NotFoundFailureCopyWithImpl<$Res>
    implements $NotFoundFailureCopyWith<$Res> {
  _$NotFoundFailureCopyWithImpl(this._self, this._then);

  final NotFoundFailure _self;
  final $Res Function(NotFoundFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? statusCode = freezed,Object? data = freezed,}) {
  return _then(NotFoundFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class ConflictFailure implements Failure {
  const ConflictFailure({required this.message, this.statusCode, this.data});
  

@override final  String message;
 final  int? statusCode;
 final  dynamic data;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConflictFailureCopyWith<ConflictFailure> get copyWith => _$ConflictFailureCopyWithImpl<ConflictFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ConflictFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message,statusCode,const DeepCollectionEquality().hash(data));
}

@override
String toString() {
    return 'Failure.conflict(message: $message, statusCode: $statusCode, data: $data)';
}


}

/// @nodoc
abstract mixin class $ConflictFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ConflictFailureCopyWith(ConflictFailure value, $Res Function(ConflictFailure) _then) = _$ConflictFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, int? statusCode, dynamic data
});




}
/// @nodoc
class _$ConflictFailureCopyWithImpl<$Res>
    implements $ConflictFailureCopyWith<$Res> {
  _$ConflictFailureCopyWithImpl(this._self, this._then);

  final ConflictFailure _self;
  final $Res Function(ConflictFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? statusCode = freezed,Object? data = freezed,}) {
  return _then(ConflictFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class RateLimitFailure implements Failure {
  const RateLimitFailure({required this.message, this.statusCode, this.data});
  

@override final  String message;
 final  int? statusCode;
 final  dynamic data;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateLimitFailureCopyWith<RateLimitFailure> get copyWith => _$RateLimitFailureCopyWithImpl<RateLimitFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RateLimitFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message,statusCode,const DeepCollectionEquality().hash(data));
}

@override
String toString() {
    return 'Failure.rateLimit(message: $message, statusCode: $statusCode, data: $data)';
}


}

/// @nodoc
abstract mixin class $RateLimitFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $RateLimitFailureCopyWith(RateLimitFailure value, $Res Function(RateLimitFailure) _then) = _$RateLimitFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, int? statusCode, dynamic data
});




}
/// @nodoc
class _$RateLimitFailureCopyWithImpl<$Res>
    implements $RateLimitFailureCopyWith<$Res> {
  _$RateLimitFailureCopyWithImpl(this._self, this._then);

  final RateLimitFailure _self;
  final $Res Function(RateLimitFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? statusCode = freezed,Object? data = freezed,}) {
  return _then(RateLimitFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class ServerFailure implements Failure {
  const ServerFailure({required this.message, this.statusCode, this.data});
  

@override final  String message;
 final  int? statusCode;
 final  dynamic data;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerFailureCopyWith<ServerFailure> get copyWith => _$ServerFailureCopyWithImpl<ServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message,statusCode,const DeepCollectionEquality().hash(data));
}

@override
String toString() {
    return 'Failure.server(message: $message, statusCode: $statusCode, data: $data)';
}


}

/// @nodoc
abstract mixin class $ServerFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ServerFailureCopyWith(ServerFailure value, $Res Function(ServerFailure) _then) = _$ServerFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, int? statusCode, dynamic data
});




}
/// @nodoc
class _$ServerFailureCopyWithImpl<$Res>
    implements $ServerFailureCopyWith<$Res> {
  _$ServerFailureCopyWithImpl(this._self, this._then);

  final ServerFailure _self;
  final $Res Function(ServerFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? statusCode = freezed,Object? data = freezed,}) {
  return _then(ServerFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class UnknownFailure implements Failure {
  const UnknownFailure({required this.message, this.statusCode, this.data});
  

@override final  String message;
 final  int? statusCode;
 final  dynamic data;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownFailureCopyWith<UnknownFailure> get copyWith => _$UnknownFailureCopyWithImpl<UnknownFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message,statusCode,const DeepCollectionEquality().hash(data));
}

@override
String toString() {
    return 'Failure.unknown(message: $message, statusCode: $statusCode, data: $data)';
}


}

/// @nodoc
abstract mixin class $UnknownFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnknownFailureCopyWith(UnknownFailure value, $Res Function(UnknownFailure) _then) = _$UnknownFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, int? statusCode, dynamic data
});




}
/// @nodoc
class _$UnknownFailureCopyWithImpl<$Res>
    implements $UnknownFailureCopyWith<$Res> {
  _$UnknownFailureCopyWithImpl(this._self, this._then);

  final UnknownFailure _self;
  final $Res Function(UnknownFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? statusCode = freezed,Object? data = freezed,}) {
  return _then(UnknownFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
