// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderProjectModel {

 String get id; String get name;
/// Create a copy of OrderProjectModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderProjectModelCopyWith<OrderProjectModel> get copyWith => _$OrderProjectModelCopyWithImpl<OrderProjectModel>(this as OrderProjectModel, _$identity);

  /// Serializes this OrderProjectModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderProjectModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderProjectModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderProjectModel;
  return Object.hash(runtimeType,_this.id,_this.name);
}

@override
String toString() {
  final _this = this as OrderProjectModel;
  return 'OrderProjectModel(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $OrderProjectModelCopyWith<$Res>  {
  factory $OrderProjectModelCopyWith(OrderProjectModel value, $Res Function(OrderProjectModel) _then) = _$OrderProjectModelCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$OrderProjectModelCopyWithImpl<$Res>
    implements $OrderProjectModelCopyWith<$Res> {
  _$OrderProjectModelCopyWithImpl(this._self, this._then);

  final OrderProjectModel _self;
  final $Res Function(OrderProjectModel) _then;

/// Create a copy of OrderProjectModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(OrderProjectModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderProjectModel].
extension OrderProjectModelPatterns on OrderProjectModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderProjectModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderProjectModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderProjectModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderProjectModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderProjectModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderProjectModel() when $default != null:
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
case _OrderProjectModel() when $default != null:
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
case _OrderProjectModel():
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
case _OrderProjectModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderProjectModel implements OrderProjectModel {
  const _OrderProjectModel({required this.id, required this.name});
  factory _OrderProjectModel.fromJson(Map<String, dynamic> json) => _$OrderProjectModelFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of OrderProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderProjectModelCopyWith<_OrderProjectModel> get copyWith => __$OrderProjectModelCopyWithImpl<_OrderProjectModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderProjectModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderProjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name);
}

@override
String toString() {
    return 'OrderProjectModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$OrderProjectModelCopyWith<$Res> implements $OrderProjectModelCopyWith<$Res> {
  factory _$OrderProjectModelCopyWith(_OrderProjectModel value, $Res Function(_OrderProjectModel) _then) = __$OrderProjectModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$OrderProjectModelCopyWithImpl<$Res>
    implements _$OrderProjectModelCopyWith<$Res> {
  __$OrderProjectModelCopyWithImpl(this._self, this._then);

  final _OrderProjectModel _self;
  final $Res Function(_OrderProjectModel) _then;

/// Create a copy of OrderProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_OrderProjectModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
