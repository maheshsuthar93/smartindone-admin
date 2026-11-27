// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PackageDetailModel {

@JsonKey(readValue: _readId) String get id;@JsonKey(readValue: _readName) String get name; String get status; String? get shipmentId;
/// Create a copy of PackageDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageDetailModelCopyWith<PackageDetailModel> get copyWith => _$PackageDetailModelCopyWithImpl<PackageDetailModel>(this as PackageDetailModel, _$identity);

  /// Serializes this PackageDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PackageDetailModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageDetailModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.shipmentId, _this.shipmentId) || other.shipmentId == _this.shipmentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PackageDetailModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.status,_this.shipmentId);
}

@override
String toString() {
  final _this = this as PackageDetailModel;
  return 'PackageDetailModel(id: ${_this.id}, name: ${_this.name}, status: ${_this.status}, shipmentId: ${_this.shipmentId})';
}


}

/// @nodoc
abstract mixin class $PackageDetailModelCopyWith<$Res>  {
  factory $PackageDetailModelCopyWith(PackageDetailModel value, $Res Function(PackageDetailModel) _then) = _$PackageDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(readValue: _readId) String id,@JsonKey(readValue: _readName) String name, String status, String? shipmentId
});




}
/// @nodoc
class _$PackageDetailModelCopyWithImpl<$Res>
    implements $PackageDetailModelCopyWith<$Res> {
  _$PackageDetailModelCopyWithImpl(this._self, this._then);

  final PackageDetailModel _self;
  final $Res Function(PackageDetailModel) _then;

/// Create a copy of PackageDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? status = null,Object? shipmentId = freezed,}) {
  return _then(PackageDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,shipmentId: freezed == shipmentId ? _self.shipmentId : shipmentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PackageDetailModel].
extension PackageDetailModelPatterns on PackageDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _PackageDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _PackageDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(readValue: _readId)  String id, @JsonKey(readValue: _readName)  String name,  String status,  String? shipmentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.shipmentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(readValue: _readId)  String id, @JsonKey(readValue: _readName)  String name,  String status,  String? shipmentId)  $default,) {final _that = this;
switch (_that) {
case _PackageDetailModel():
return $default(_that.id,_that.name,_that.status,_that.shipmentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(readValue: _readId)  String id, @JsonKey(readValue: _readName)  String name,  String status,  String? shipmentId)?  $default,) {final _that = this;
switch (_that) {
case _PackageDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.shipmentId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PackageDetailModel implements PackageDetailModel {
  const _PackageDetailModel({@JsonKey(readValue: _readId) required this.id, @JsonKey(readValue: _readName) required this.name, this.status = 'PACKING', this.shipmentId});
  factory _PackageDetailModel.fromJson(Map<String, dynamic> json) => _$PackageDetailModelFromJson(json);

@override@JsonKey(readValue: _readId) final  String id;
@override@JsonKey(readValue: _readName) final  String name;
@override@JsonKey() final  String status;
@override final  String? shipmentId;

/// Create a copy of PackageDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageDetailModelCopyWith<_PackageDetailModel> get copyWith => __$PackageDetailModelCopyWithImpl<_PackageDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.shipmentId, shipmentId) || other.shipmentId == shipmentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,status,shipmentId);
}

@override
String toString() {
    return 'PackageDetailModel(id: $id, name: $name, status: $status, shipmentId: $shipmentId)';
}


}

/// @nodoc
abstract mixin class _$PackageDetailModelCopyWith<$Res> implements $PackageDetailModelCopyWith<$Res> {
  factory _$PackageDetailModelCopyWith(_PackageDetailModel value, $Res Function(_PackageDetailModel) _then) = __$PackageDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(readValue: _readId) String id,@JsonKey(readValue: _readName) String name, String status, String? shipmentId
});




}
/// @nodoc
class __$PackageDetailModelCopyWithImpl<$Res>
    implements _$PackageDetailModelCopyWith<$Res> {
  __$PackageDetailModelCopyWithImpl(this._self, this._then);

  final _PackageDetailModel _self;
  final $Res Function(_PackageDetailModel) _then;

/// Create a copy of PackageDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? status = null,Object? shipmentId = freezed,}) {
  return _then(_PackageDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,shipmentId: freezed == shipmentId ? _self.shipmentId : shipmentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
