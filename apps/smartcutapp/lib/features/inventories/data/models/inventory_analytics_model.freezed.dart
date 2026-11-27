// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_analytics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InventoryAnalyticsModel {

 int get total; int get materialCount; int get hardwareCount; int get onHand; int get reserved; int get available;
/// Create a copy of InventoryAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryAnalyticsModelCopyWith<InventoryAnalyticsModel> get copyWith => _$InventoryAnalyticsModelCopyWithImpl<InventoryAnalyticsModel>(this as InventoryAnalyticsModel, _$identity);

  /// Serializes this InventoryAnalyticsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as InventoryAnalyticsModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryAnalyticsModel&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.materialCount, _this.materialCount) || other.materialCount == _this.materialCount)&&(identical(other.hardwareCount, _this.hardwareCount) || other.hardwareCount == _this.hardwareCount)&&(identical(other.onHand, _this.onHand) || other.onHand == _this.onHand)&&(identical(other.reserved, _this.reserved) || other.reserved == _this.reserved)&&(identical(other.available, _this.available) || other.available == _this.available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as InventoryAnalyticsModel;
  return Object.hash(runtimeType,_this.total,_this.materialCount,_this.hardwareCount,_this.onHand,_this.reserved,_this.available);
}

@override
String toString() {
  final _this = this as InventoryAnalyticsModel;
  return 'InventoryAnalyticsModel(total: ${_this.total}, materialCount: ${_this.materialCount}, hardwareCount: ${_this.hardwareCount}, onHand: ${_this.onHand}, reserved: ${_this.reserved}, available: ${_this.available})';
}


}

/// @nodoc
abstract mixin class $InventoryAnalyticsModelCopyWith<$Res>  {
  factory $InventoryAnalyticsModelCopyWith(InventoryAnalyticsModel value, $Res Function(InventoryAnalyticsModel) _then) = _$InventoryAnalyticsModelCopyWithImpl;
@useResult
$Res call({
 int total, int materialCount, int hardwareCount, int onHand, int reserved, int available
});




}
/// @nodoc
class _$InventoryAnalyticsModelCopyWithImpl<$Res>
    implements $InventoryAnalyticsModelCopyWith<$Res> {
  _$InventoryAnalyticsModelCopyWithImpl(this._self, this._then);

  final InventoryAnalyticsModel _self;
  final $Res Function(InventoryAnalyticsModel) _then;

/// Create a copy of InventoryAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? materialCount = null,Object? hardwareCount = null,Object? onHand = null,Object? reserved = null,Object? available = null,}) {
  return _then(InventoryAnalyticsModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,materialCount: null == materialCount ? _self.materialCount : materialCount // ignore: cast_nullable_to_non_nullable
as int,hardwareCount: null == hardwareCount ? _self.hardwareCount : hardwareCount // ignore: cast_nullable_to_non_nullable
as int,onHand: null == onHand ? _self.onHand : onHand // ignore: cast_nullable_to_non_nullable
as int,reserved: null == reserved ? _self.reserved : reserved // ignore: cast_nullable_to_non_nullable
as int,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [InventoryAnalyticsModel].
extension InventoryAnalyticsModelPatterns on InventoryAnalyticsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventoryAnalyticsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventoryAnalyticsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventoryAnalyticsModel value)  $default,){
final _that = this;
switch (_that) {
case _InventoryAnalyticsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventoryAnalyticsModel value)?  $default,){
final _that = this;
switch (_that) {
case _InventoryAnalyticsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int materialCount,  int hardwareCount,  int onHand,  int reserved,  int available)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventoryAnalyticsModel() when $default != null:
return $default(_that.total,_that.materialCount,_that.hardwareCount,_that.onHand,_that.reserved,_that.available);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int materialCount,  int hardwareCount,  int onHand,  int reserved,  int available)  $default,) {final _that = this;
switch (_that) {
case _InventoryAnalyticsModel():
return $default(_that.total,_that.materialCount,_that.hardwareCount,_that.onHand,_that.reserved,_that.available);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int materialCount,  int hardwareCount,  int onHand,  int reserved,  int available)?  $default,) {final _that = this;
switch (_that) {
case _InventoryAnalyticsModel() when $default != null:
return $default(_that.total,_that.materialCount,_that.hardwareCount,_that.onHand,_that.reserved,_that.available);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InventoryAnalyticsModel implements InventoryAnalyticsModel {
  const _InventoryAnalyticsModel({required this.total, required this.materialCount, required this.hardwareCount, required this.onHand, required this.reserved, required this.available});
  factory _InventoryAnalyticsModel.fromJson(Map<String, dynamic> json) => _$InventoryAnalyticsModelFromJson(json);

@override final  int total;
@override final  int materialCount;
@override final  int hardwareCount;
@override final  int onHand;
@override final  int reserved;
@override final  int available;

/// Create a copy of InventoryAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventoryAnalyticsModelCopyWith<_InventoryAnalyticsModel> get copyWith => __$InventoryAnalyticsModelCopyWithImpl<_InventoryAnalyticsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InventoryAnalyticsModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventoryAnalyticsModel&&(identical(other.total, total) || other.total == total)&&(identical(other.materialCount, materialCount) || other.materialCount == materialCount)&&(identical(other.hardwareCount, hardwareCount) || other.hardwareCount == hardwareCount)&&(identical(other.onHand, onHand) || other.onHand == onHand)&&(identical(other.reserved, reserved) || other.reserved == reserved)&&(identical(other.available, available) || other.available == available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,total,materialCount,hardwareCount,onHand,reserved,available);
}

@override
String toString() {
    return 'InventoryAnalyticsModel(total: $total, materialCount: $materialCount, hardwareCount: $hardwareCount, onHand: $onHand, reserved: $reserved, available: $available)';
}


}

/// @nodoc
abstract mixin class _$InventoryAnalyticsModelCopyWith<$Res> implements $InventoryAnalyticsModelCopyWith<$Res> {
  factory _$InventoryAnalyticsModelCopyWith(_InventoryAnalyticsModel value, $Res Function(_InventoryAnalyticsModel) _then) = __$InventoryAnalyticsModelCopyWithImpl;
@override @useResult
$Res call({
 int total, int materialCount, int hardwareCount, int onHand, int reserved, int available
});




}
/// @nodoc
class __$InventoryAnalyticsModelCopyWithImpl<$Res>
    implements _$InventoryAnalyticsModelCopyWith<$Res> {
  __$InventoryAnalyticsModelCopyWithImpl(this._self, this._then);

  final _InventoryAnalyticsModel _self;
  final $Res Function(_InventoryAnalyticsModel) _then;

/// Create a copy of InventoryAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? materialCount = null,Object? hardwareCount = null,Object? onHand = null,Object? reserved = null,Object? available = null,}) {
  return _then(_InventoryAnalyticsModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,materialCount: null == materialCount ? _self.materialCount : materialCount // ignore: cast_nullable_to_non_nullable
as int,hardwareCount: null == hardwareCount ? _self.hardwareCount : hardwareCount // ignore: cast_nullable_to_non_nullable
as int,onHand: null == onHand ? _self.onHand : onHand // ignore: cast_nullable_to_non_nullable
as int,reserved: null == reserved ? _self.reserved : reserved // ignore: cast_nullable_to_non_nullable
as int,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
