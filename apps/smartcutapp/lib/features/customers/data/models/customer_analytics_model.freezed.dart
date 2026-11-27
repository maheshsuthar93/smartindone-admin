// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_analytics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerAnalyticsModel {

 int get total; int get active; int get inActive;
/// Create a copy of CustomerAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerAnalyticsModelCopyWith<CustomerAnalyticsModel> get copyWith => _$CustomerAnalyticsModelCopyWithImpl<CustomerAnalyticsModel>(this as CustomerAnalyticsModel, _$identity);

  /// Serializes this CustomerAnalyticsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CustomerAnalyticsModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerAnalyticsModel&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.inActive, _this.inActive) || other.inActive == _this.inActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CustomerAnalyticsModel;
  return Object.hash(runtimeType,_this.total,_this.active,_this.inActive);
}

@override
String toString() {
  final _this = this as CustomerAnalyticsModel;
  return 'CustomerAnalyticsModel(total: ${_this.total}, active: ${_this.active}, inActive: ${_this.inActive})';
}


}

/// @nodoc
abstract mixin class $CustomerAnalyticsModelCopyWith<$Res>  {
  factory $CustomerAnalyticsModelCopyWith(CustomerAnalyticsModel value, $Res Function(CustomerAnalyticsModel) _then) = _$CustomerAnalyticsModelCopyWithImpl;
@useResult
$Res call({
 int total, int active, int inActive
});




}
/// @nodoc
class _$CustomerAnalyticsModelCopyWithImpl<$Res>
    implements $CustomerAnalyticsModelCopyWith<$Res> {
  _$CustomerAnalyticsModelCopyWithImpl(this._self, this._then);

  final CustomerAnalyticsModel _self;
  final $Res Function(CustomerAnalyticsModel) _then;

/// Create a copy of CustomerAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? active = null,Object? inActive = null,}) {
  return _then(CustomerAnalyticsModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as int,inActive: null == inActive ? _self.inActive : inActive // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerAnalyticsModel].
extension CustomerAnalyticsModelPatterns on CustomerAnalyticsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerAnalyticsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerAnalyticsModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerAnalyticsModel value)  $default,){
final _that = this;
switch (_that) {
case _CustomerAnalyticsModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerAnalyticsModel value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerAnalyticsModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int active,  int inActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerAnalyticsModel() when $default != null:
return $default(_that.total,_that.active,_that.inActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int active,  int inActive)  $default,) {final _that = this;
switch (_that) {
case _CustomerAnalyticsModel():
return $default(_that.total,_that.active,_that.inActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int active,  int inActive)?  $default,) {final _that = this;
switch (_that) {
case _CustomerAnalyticsModel() when $default != null:
return $default(_that.total,_that.active,_that.inActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerAnalyticsModel implements CustomerAnalyticsModel {
  const _CustomerAnalyticsModel({required this.total, required this.active, required this.inActive});
  factory _CustomerAnalyticsModel.fromJson(Map<String, dynamic> json) => _$CustomerAnalyticsModelFromJson(json);

@override final  int total;
@override final  int active;
@override final  int inActive;

/// Create a copy of CustomerAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerAnalyticsModelCopyWith<_CustomerAnalyticsModel> get copyWith => __$CustomerAnalyticsModelCopyWithImpl<_CustomerAnalyticsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerAnalyticsModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerAnalyticsModel&&(identical(other.total, total) || other.total == total)&&(identical(other.active, active) || other.active == active)&&(identical(other.inActive, inActive) || other.inActive == inActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,total,active,inActive);
}

@override
String toString() {
    return 'CustomerAnalyticsModel(total: $total, active: $active, inActive: $inActive)';
}


}

/// @nodoc
abstract mixin class _$CustomerAnalyticsModelCopyWith<$Res> implements $CustomerAnalyticsModelCopyWith<$Res> {
  factory _$CustomerAnalyticsModelCopyWith(_CustomerAnalyticsModel value, $Res Function(_CustomerAnalyticsModel) _then) = __$CustomerAnalyticsModelCopyWithImpl;
@override @useResult
$Res call({
 int total, int active, int inActive
});




}
/// @nodoc
class __$CustomerAnalyticsModelCopyWithImpl<$Res>
    implements _$CustomerAnalyticsModelCopyWith<$Res> {
  __$CustomerAnalyticsModelCopyWithImpl(this._self, this._then);

  final _CustomerAnalyticsModel _self;
  final $Res Function(_CustomerAnalyticsModel) _then;

/// Create a copy of CustomerAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? active = null,Object? inActive = null,}) {
  return _then(_CustomerAnalyticsModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as int,inActive: null == inActive ? _self.inActive : inActive // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
