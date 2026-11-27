// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_shipment_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateShipmentOrderModel {

 String get id; String get orderCode;
/// Create a copy of CreateShipmentOrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateShipmentOrderModelCopyWith<CreateShipmentOrderModel> get copyWith => _$CreateShipmentOrderModelCopyWithImpl<CreateShipmentOrderModel>(this as CreateShipmentOrderModel, _$identity);

  /// Serializes this CreateShipmentOrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CreateShipmentOrderModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateShipmentOrderModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.orderCode, _this.orderCode) || other.orderCode == _this.orderCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CreateShipmentOrderModel;
  return Object.hash(runtimeType,_this.id,_this.orderCode);
}

@override
String toString() {
  final _this = this as CreateShipmentOrderModel;
  return 'CreateShipmentOrderModel(id: ${_this.id}, orderCode: ${_this.orderCode})';
}


}

/// @nodoc
abstract mixin class $CreateShipmentOrderModelCopyWith<$Res>  {
  factory $CreateShipmentOrderModelCopyWith(CreateShipmentOrderModel value, $Res Function(CreateShipmentOrderModel) _then) = _$CreateShipmentOrderModelCopyWithImpl;
@useResult
$Res call({
 String id, String orderCode
});




}
/// @nodoc
class _$CreateShipmentOrderModelCopyWithImpl<$Res>
    implements $CreateShipmentOrderModelCopyWith<$Res> {
  _$CreateShipmentOrderModelCopyWithImpl(this._self, this._then);

  final CreateShipmentOrderModel _self;
  final $Res Function(CreateShipmentOrderModel) _then;

/// Create a copy of CreateShipmentOrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderCode = null,}) {
  return _then(CreateShipmentOrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderCode: null == orderCode ? _self.orderCode : orderCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateShipmentOrderModel].
extension CreateShipmentOrderModelPatterns on CreateShipmentOrderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateShipmentOrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateShipmentOrderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateShipmentOrderModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateShipmentOrderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateShipmentOrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateShipmentOrderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orderCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateShipmentOrderModel() when $default != null:
return $default(_that.id,_that.orderCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orderCode)  $default,) {final _that = this;
switch (_that) {
case _CreateShipmentOrderModel():
return $default(_that.id,_that.orderCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orderCode)?  $default,) {final _that = this;
switch (_that) {
case _CreateShipmentOrderModel() when $default != null:
return $default(_that.id,_that.orderCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateShipmentOrderModel implements CreateShipmentOrderModel {
  const _CreateShipmentOrderModel({required this.id, required this.orderCode});
  factory _CreateShipmentOrderModel.fromJson(Map<String, dynamic> json) => _$CreateShipmentOrderModelFromJson(json);

@override final  String id;
@override final  String orderCode;

/// Create a copy of CreateShipmentOrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateShipmentOrderModelCopyWith<_CreateShipmentOrderModel> get copyWith => __$CreateShipmentOrderModelCopyWithImpl<_CreateShipmentOrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateShipmentOrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateShipmentOrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderCode, orderCode) || other.orderCode == orderCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,orderCode);
}

@override
String toString() {
    return 'CreateShipmentOrderModel(id: $id, orderCode: $orderCode)';
}


}

/// @nodoc
abstract mixin class _$CreateShipmentOrderModelCopyWith<$Res> implements $CreateShipmentOrderModelCopyWith<$Res> {
  factory _$CreateShipmentOrderModelCopyWith(_CreateShipmentOrderModel value, $Res Function(_CreateShipmentOrderModel) _then) = __$CreateShipmentOrderModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderCode
});




}
/// @nodoc
class __$CreateShipmentOrderModelCopyWithImpl<$Res>
    implements _$CreateShipmentOrderModelCopyWith<$Res> {
  __$CreateShipmentOrderModelCopyWithImpl(this._self, this._then);

  final _CreateShipmentOrderModel _self;
  final $Res Function(_CreateShipmentOrderModel) _then;

/// Create a copy of CreateShipmentOrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderCode = null,}) {
  return _then(_CreateShipmentOrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderCode: null == orderCode ? _self.orderCode : orderCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
