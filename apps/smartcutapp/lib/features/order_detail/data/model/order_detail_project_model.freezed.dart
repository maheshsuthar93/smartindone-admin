// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail_project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderDetailProjectModel {

 String get id; String get name;
/// Create a copy of OrderDetailProjectModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailProjectModelCopyWith<OrderDetailProjectModel> get copyWith => _$OrderDetailProjectModelCopyWithImpl<OrderDetailProjectModel>(this as OrderDetailProjectModel, _$identity);

  /// Serializes this OrderDetailProjectModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderDetailProjectModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailProjectModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderDetailProjectModel;
  return Object.hash(runtimeType,_this.id,_this.name);
}

@override
String toString() {
  final _this = this as OrderDetailProjectModel;
  return 'OrderDetailProjectModel(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $OrderDetailProjectModelCopyWith<$Res>  {
  factory $OrderDetailProjectModelCopyWith(OrderDetailProjectModel value, $Res Function(OrderDetailProjectModel) _then) = _$OrderDetailProjectModelCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$OrderDetailProjectModelCopyWithImpl<$Res>
    implements $OrderDetailProjectModelCopyWith<$Res> {
  _$OrderDetailProjectModelCopyWithImpl(this._self, this._then);

  final OrderDetailProjectModel _self;
  final $Res Function(OrderDetailProjectModel) _then;

/// Create a copy of OrderDetailProjectModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(OrderDetailProjectModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderDetailProjectModel].
extension OrderDetailProjectModelPatterns on OrderDetailProjectModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDetailProjectModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDetailProjectModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDetailProjectModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderDetailProjectModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDetailProjectModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDetailProjectModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDetailProjectModel() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name)  $default,) {final _that = this;
switch (_that) {
case _OrderDetailProjectModel():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _OrderDetailProjectModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDetailProjectModel implements OrderDetailProjectModel {
  const _OrderDetailProjectModel({required this.id, required this.name});
  factory _OrderDetailProjectModel.fromJson(Map<String, dynamic> json) => _$OrderDetailProjectModelFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of OrderDetailProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDetailProjectModelCopyWith<_OrderDetailProjectModel> get copyWith => __$OrderDetailProjectModelCopyWithImpl<_OrderDetailProjectModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDetailProjectModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDetailProjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name);
}

@override
String toString() {
    return 'OrderDetailProjectModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$OrderDetailProjectModelCopyWith<$Res> implements $OrderDetailProjectModelCopyWith<$Res> {
  factory _$OrderDetailProjectModelCopyWith(_OrderDetailProjectModel value, $Res Function(_OrderDetailProjectModel) _then) = __$OrderDetailProjectModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$OrderDetailProjectModelCopyWithImpl<$Res>
    implements _$OrderDetailProjectModelCopyWith<$Res> {
  __$OrderDetailProjectModelCopyWithImpl(this._self, this._then);

  final _OrderDetailProjectModel _self;
  final $Res Function(_OrderDetailProjectModel) _then;

/// Create a copy of OrderDetailProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_OrderDetailProjectModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
