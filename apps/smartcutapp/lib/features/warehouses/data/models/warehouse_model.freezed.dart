// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warehouse_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WarehouseModel {

 String get id; String get companyId; String get factoryId; String? get location; String get name; String? get contactName; String? get contactEmail; String? get contactPhone; WarehouseStatus get status;
/// Create a copy of WarehouseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarehouseModelCopyWith<WarehouseModel> get copyWith => _$WarehouseModelCopyWithImpl<WarehouseModel>(this as WarehouseModel, _$identity);

  /// Serializes this WarehouseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WarehouseModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarehouseModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.companyId, _this.companyId) || other.companyId == _this.companyId)&&(identical(other.factoryId, _this.factoryId) || other.factoryId == _this.factoryId)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.contactName, _this.contactName) || other.contactName == _this.contactName)&&(identical(other.contactEmail, _this.contactEmail) || other.contactEmail == _this.contactEmail)&&(identical(other.contactPhone, _this.contactPhone) || other.contactPhone == _this.contactPhone)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WarehouseModel;
  return Object.hash(runtimeType,_this.id,_this.companyId,_this.factoryId,_this.location,_this.name,_this.contactName,_this.contactEmail,_this.contactPhone,_this.status);
}

@override
String toString() {
  final _this = this as WarehouseModel;
  return 'WarehouseModel(id: ${_this.id}, companyId: ${_this.companyId}, factoryId: ${_this.factoryId}, location: ${_this.location}, name: ${_this.name}, contactName: ${_this.contactName}, contactEmail: ${_this.contactEmail}, contactPhone: ${_this.contactPhone}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $WarehouseModelCopyWith<$Res>  {
  factory $WarehouseModelCopyWith(WarehouseModel value, $Res Function(WarehouseModel) _then) = _$WarehouseModelCopyWithImpl;
@useResult
$Res call({
 String id, String companyId, String factoryId, String? location, String name, String? contactName, String? contactEmail, String? contactPhone, WarehouseStatus status
});




}
/// @nodoc
class _$WarehouseModelCopyWithImpl<$Res>
    implements $WarehouseModelCopyWith<$Res> {
  _$WarehouseModelCopyWithImpl(this._self, this._then);

  final WarehouseModel _self;
  final $Res Function(WarehouseModel) _then;

/// Create a copy of WarehouseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyId = null,Object? factoryId = null,Object? location = freezed,Object? name = null,Object? contactName = freezed,Object? contactEmail = freezed,Object? contactPhone = freezed,Object? status = null,}) {
  return _then(WarehouseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,factoryId: null == factoryId ? _self.factoryId : factoryId // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WarehouseStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [WarehouseModel].
extension WarehouseModelPatterns on WarehouseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarehouseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarehouseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarehouseModel value)  $default,){
final _that = this;
switch (_that) {
case _WarehouseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarehouseModel value)?  $default,){
final _that = this;
switch (_that) {
case _WarehouseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String companyId,  String factoryId,  String? location,  String name,  String? contactName,  String? contactEmail,  String? contactPhone,  WarehouseStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarehouseModel() when $default != null:
return $default(_that.id,_that.companyId,_that.factoryId,_that.location,_that.name,_that.contactName,_that.contactEmail,_that.contactPhone,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String companyId,  String factoryId,  String? location,  String name,  String? contactName,  String? contactEmail,  String? contactPhone,  WarehouseStatus status)  $default,) {final _that = this;
switch (_that) {
case _WarehouseModel():
return $default(_that.id,_that.companyId,_that.factoryId,_that.location,_that.name,_that.contactName,_that.contactEmail,_that.contactPhone,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String companyId,  String factoryId,  String? location,  String name,  String? contactName,  String? contactEmail,  String? contactPhone,  WarehouseStatus status)?  $default,) {final _that = this;
switch (_that) {
case _WarehouseModel() when $default != null:
return $default(_that.id,_that.companyId,_that.factoryId,_that.location,_that.name,_that.contactName,_that.contactEmail,_that.contactPhone,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarehouseModel implements WarehouseModel {
  const _WarehouseModel({required this.id, required this.companyId, required this.factoryId, this.location, required this.name, this.contactName, this.contactEmail, this.contactPhone, required this.status});
  factory _WarehouseModel.fromJson(Map<String, dynamic> json) => _$WarehouseModelFromJson(json);

@override final  String id;
@override final  String companyId;
@override final  String factoryId;
@override final  String? location;
@override final  String name;
@override final  String? contactName;
@override final  String? contactEmail;
@override final  String? contactPhone;
@override final  WarehouseStatus status;

/// Create a copy of WarehouseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarehouseModelCopyWith<_WarehouseModel> get copyWith => __$WarehouseModelCopyWithImpl<_WarehouseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarehouseModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarehouseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.factoryId, factoryId) || other.factoryId == factoryId)&&(identical(other.location, location) || other.location == location)&&(identical(other.name, name) || other.name == name)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,companyId,factoryId,location,name,contactName,contactEmail,contactPhone,status);
}

@override
String toString() {
    return 'WarehouseModel(id: $id, companyId: $companyId, factoryId: $factoryId, location: $location, name: $name, contactName: $contactName, contactEmail: $contactEmail, contactPhone: $contactPhone, status: $status)';
}


}

/// @nodoc
abstract mixin class _$WarehouseModelCopyWith<$Res> implements $WarehouseModelCopyWith<$Res> {
  factory _$WarehouseModelCopyWith(_WarehouseModel value, $Res Function(_WarehouseModel) _then) = __$WarehouseModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String companyId, String factoryId, String? location, String name, String? contactName, String? contactEmail, String? contactPhone, WarehouseStatus status
});




}
/// @nodoc
class __$WarehouseModelCopyWithImpl<$Res>
    implements _$WarehouseModelCopyWith<$Res> {
  __$WarehouseModelCopyWithImpl(this._self, this._then);

  final _WarehouseModel _self;
  final $Res Function(_WarehouseModel) _then;

/// Create a copy of WarehouseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyId = null,Object? factoryId = null,Object? location = freezed,Object? name = null,Object? contactName = freezed,Object? contactEmail = freezed,Object? contactPhone = freezed,Object? status = null,}) {
  return _then(_WarehouseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,factoryId: null == factoryId ? _self.factoryId : factoryId // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WarehouseStatus,
  ));
}


}

// dart format on
