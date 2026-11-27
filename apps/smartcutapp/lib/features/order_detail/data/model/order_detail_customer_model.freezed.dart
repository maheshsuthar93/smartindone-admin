// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail_customer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderDetailCustomerModel {

 String get id; String get name; String? get contactName; String? get contactPhone; String? get contactEmail;
/// Create a copy of OrderDetailCustomerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailCustomerModelCopyWith<OrderDetailCustomerModel> get copyWith => _$OrderDetailCustomerModelCopyWithImpl<OrderDetailCustomerModel>(this as OrderDetailCustomerModel, _$identity);

  /// Serializes this OrderDetailCustomerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderDetailCustomerModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailCustomerModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.contactName, _this.contactName) || other.contactName == _this.contactName)&&(identical(other.contactPhone, _this.contactPhone) || other.contactPhone == _this.contactPhone)&&(identical(other.contactEmail, _this.contactEmail) || other.contactEmail == _this.contactEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderDetailCustomerModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.contactName,_this.contactPhone,_this.contactEmail);
}

@override
String toString() {
  final _this = this as OrderDetailCustomerModel;
  return 'OrderDetailCustomerModel(id: ${_this.id}, name: ${_this.name}, contactName: ${_this.contactName}, contactPhone: ${_this.contactPhone}, contactEmail: ${_this.contactEmail})';
}


}

/// @nodoc
abstract mixin class $OrderDetailCustomerModelCopyWith<$Res>  {
  factory $OrderDetailCustomerModelCopyWith(OrderDetailCustomerModel value, $Res Function(OrderDetailCustomerModel) _then) = _$OrderDetailCustomerModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? contactName, String? contactPhone, String? contactEmail
});




}
/// @nodoc
class _$OrderDetailCustomerModelCopyWithImpl<$Res>
    implements $OrderDetailCustomerModelCopyWith<$Res> {
  _$OrderDetailCustomerModelCopyWithImpl(this._self, this._then);

  final OrderDetailCustomerModel _self;
  final $Res Function(OrderDetailCustomerModel) _then;

/// Create a copy of OrderDetailCustomerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? contactName = freezed,Object? contactPhone = freezed,Object? contactEmail = freezed,}) {
  return _then(OrderDetailCustomerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderDetailCustomerModel].
extension OrderDetailCustomerModelPatterns on OrderDetailCustomerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDetailCustomerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDetailCustomerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDetailCustomerModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderDetailCustomerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDetailCustomerModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDetailCustomerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? contactName,  String? contactPhone,  String? contactEmail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDetailCustomerModel() when $default != null:
return $default(_that.id,_that.name,_that.contactName,_that.contactPhone,_that.contactEmail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? contactName,  String? contactPhone,  String? contactEmail)  $default,) {final _that = this;
switch (_that) {
case _OrderDetailCustomerModel():
return $default(_that.id,_that.name,_that.contactName,_that.contactPhone,_that.contactEmail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? contactName,  String? contactPhone,  String? contactEmail)?  $default,) {final _that = this;
switch (_that) {
case _OrderDetailCustomerModel() when $default != null:
return $default(_that.id,_that.name,_that.contactName,_that.contactPhone,_that.contactEmail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDetailCustomerModel implements OrderDetailCustomerModel {
  const _OrderDetailCustomerModel({required this.id, required this.name, this.contactName, this.contactPhone, this.contactEmail});
  factory _OrderDetailCustomerModel.fromJson(Map<String, dynamic> json) => _$OrderDetailCustomerModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? contactName;
@override final  String? contactPhone;
@override final  String? contactEmail;

/// Create a copy of OrderDetailCustomerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDetailCustomerModelCopyWith<_OrderDetailCustomerModel> get copyWith => __$OrderDetailCustomerModelCopyWithImpl<_OrderDetailCustomerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDetailCustomerModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDetailCustomerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,contactName,contactPhone,contactEmail);
}

@override
String toString() {
    return 'OrderDetailCustomerModel(id: $id, name: $name, contactName: $contactName, contactPhone: $contactPhone, contactEmail: $contactEmail)';
}


}

/// @nodoc
abstract mixin class _$OrderDetailCustomerModelCopyWith<$Res> implements $OrderDetailCustomerModelCopyWith<$Res> {
  factory _$OrderDetailCustomerModelCopyWith(_OrderDetailCustomerModel value, $Res Function(_OrderDetailCustomerModel) _then) = __$OrderDetailCustomerModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? contactName, String? contactPhone, String? contactEmail
});




}
/// @nodoc
class __$OrderDetailCustomerModelCopyWithImpl<$Res>
    implements _$OrderDetailCustomerModelCopyWith<$Res> {
  __$OrderDetailCustomerModelCopyWithImpl(this._self, this._then);

  final _OrderDetailCustomerModel _self;
  final $Res Function(_OrderDetailCustomerModel) _then;

/// Create a copy of OrderDetailCustomerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? contactName = freezed,Object? contactPhone = freezed,Object? contactEmail = freezed,}) {
  return _then(_OrderDetailCustomerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
