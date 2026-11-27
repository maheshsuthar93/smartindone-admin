// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_analytics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderAnalyticsModel {

 int get total; int get active; int get completed;
/// Create a copy of OrderAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderAnalyticsModelCopyWith<OrderAnalyticsModel> get copyWith => _$OrderAnalyticsModelCopyWithImpl<OrderAnalyticsModel>(this as OrderAnalyticsModel, _$identity);

  /// Serializes this OrderAnalyticsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderAnalyticsModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderAnalyticsModel&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.completed, _this.completed) || other.completed == _this.completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderAnalyticsModel;
  return Object.hash(runtimeType,_this.total,_this.active,_this.completed);
}

@override
String toString() {
  final _this = this as OrderAnalyticsModel;
  return 'OrderAnalyticsModel(total: ${_this.total}, active: ${_this.active}, completed: ${_this.completed})';
}


}

/// @nodoc
abstract mixin class $OrderAnalyticsModelCopyWith<$Res>  {
  factory $OrderAnalyticsModelCopyWith(OrderAnalyticsModel value, $Res Function(OrderAnalyticsModel) _then) = _$OrderAnalyticsModelCopyWithImpl;
@useResult
$Res call({
 int total, int active, int completed
});




}
/// @nodoc
class _$OrderAnalyticsModelCopyWithImpl<$Res>
    implements $OrderAnalyticsModelCopyWith<$Res> {
  _$OrderAnalyticsModelCopyWithImpl(this._self, this._then);

  final OrderAnalyticsModel _self;
  final $Res Function(OrderAnalyticsModel) _then;

/// Create a copy of OrderAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? active = null,Object? completed = null,}) {
  return _then(OrderAnalyticsModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderAnalyticsModel].
extension OrderAnalyticsModelPatterns on OrderAnalyticsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderAnalyticsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderAnalyticsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderAnalyticsModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderAnalyticsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderAnalyticsModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderAnalyticsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int active,  int completed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderAnalyticsModel() when $default != null:
return $default(_that.total,_that.active,_that.completed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int active,  int completed)  $default,) {final _that = this;
switch (_that) {
case _OrderAnalyticsModel():
return $default(_that.total,_that.active,_that.completed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int active,  int completed)?  $default,) {final _that = this;
switch (_that) {
case _OrderAnalyticsModel() when $default != null:
return $default(_that.total,_that.active,_that.completed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderAnalyticsModel implements OrderAnalyticsModel {
  const _OrderAnalyticsModel({required this.total, required this.active, required this.completed});
  factory _OrderAnalyticsModel.fromJson(Map<String, dynamic> json) => _$OrderAnalyticsModelFromJson(json);

@override final  int total;
@override final  int active;
@override final  int completed;

/// Create a copy of OrderAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderAnalyticsModelCopyWith<_OrderAnalyticsModel> get copyWith => __$OrderAnalyticsModelCopyWithImpl<_OrderAnalyticsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderAnalyticsModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderAnalyticsModel&&(identical(other.total, total) || other.total == total)&&(identical(other.active, active) || other.active == active)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,total,active,completed);
}

@override
String toString() {
    return 'OrderAnalyticsModel(total: $total, active: $active, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$OrderAnalyticsModelCopyWith<$Res> implements $OrderAnalyticsModelCopyWith<$Res> {
  factory _$OrderAnalyticsModelCopyWith(_OrderAnalyticsModel value, $Res Function(_OrderAnalyticsModel) _then) = __$OrderAnalyticsModelCopyWithImpl;
@override @useResult
$Res call({
 int total, int active, int completed
});




}
/// @nodoc
class __$OrderAnalyticsModelCopyWithImpl<$Res>
    implements _$OrderAnalyticsModelCopyWith<$Res> {
  __$OrderAnalyticsModelCopyWithImpl(this._self, this._then);

  final _OrderAnalyticsModel _self;
  final $Res Function(_OrderAnalyticsModel) _then;

/// Create a copy of OrderAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? active = null,Object? completed = null,}) {
  return _then(_OrderAnalyticsModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
