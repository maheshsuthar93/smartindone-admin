// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_order_project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardOrderProjectModel {

 String get id; String get name;
/// Create a copy of DashboardOrderProjectModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardOrderProjectModelCopyWith<DashboardOrderProjectModel> get copyWith => _$DashboardOrderProjectModelCopyWithImpl<DashboardOrderProjectModel>(this as DashboardOrderProjectModel, _$identity);

  /// Serializes this DashboardOrderProjectModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DashboardOrderProjectModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardOrderProjectModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DashboardOrderProjectModel;
  return Object.hash(runtimeType,_this.id,_this.name);
}

@override
String toString() {
  final _this = this as DashboardOrderProjectModel;
  return 'DashboardOrderProjectModel(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $DashboardOrderProjectModelCopyWith<$Res>  {
  factory $DashboardOrderProjectModelCopyWith(DashboardOrderProjectModel value, $Res Function(DashboardOrderProjectModel) _then) = _$DashboardOrderProjectModelCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$DashboardOrderProjectModelCopyWithImpl<$Res>
    implements $DashboardOrderProjectModelCopyWith<$Res> {
  _$DashboardOrderProjectModelCopyWithImpl(this._self, this._then);

  final DashboardOrderProjectModel _self;
  final $Res Function(DashboardOrderProjectModel) _then;

/// Create a copy of DashboardOrderProjectModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(DashboardOrderProjectModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardOrderProjectModel].
extension DashboardOrderProjectModelPatterns on DashboardOrderProjectModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardOrderProjectModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardOrderProjectModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardOrderProjectModel value)  $default,){
final _that = this;
switch (_that) {
case _DashboardOrderProjectModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardOrderProjectModel value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardOrderProjectModel() when $default != null:
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
case _DashboardOrderProjectModel() when $default != null:
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
case _DashboardOrderProjectModel():
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
case _DashboardOrderProjectModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardOrderProjectModel implements DashboardOrderProjectModel {
  const _DashboardOrderProjectModel({required this.id, required this.name});
  factory _DashboardOrderProjectModel.fromJson(Map<String, dynamic> json) => _$DashboardOrderProjectModelFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of DashboardOrderProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardOrderProjectModelCopyWith<_DashboardOrderProjectModel> get copyWith => __$DashboardOrderProjectModelCopyWithImpl<_DashboardOrderProjectModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardOrderProjectModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardOrderProjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name);
}

@override
String toString() {
    return 'DashboardOrderProjectModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$DashboardOrderProjectModelCopyWith<$Res> implements $DashboardOrderProjectModelCopyWith<$Res> {
  factory _$DashboardOrderProjectModelCopyWith(_DashboardOrderProjectModel value, $Res Function(_DashboardOrderProjectModel) _then) = __$DashboardOrderProjectModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$DashboardOrderProjectModelCopyWithImpl<$Res>
    implements _$DashboardOrderProjectModelCopyWith<$Res> {
  __$DashboardOrderProjectModelCopyWithImpl(this._self, this._then);

  final _DashboardOrderProjectModel _self;
  final $Res Function(_DashboardOrderProjectModel) _then;

/// Create a copy of DashboardOrderProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_DashboardOrderProjectModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
