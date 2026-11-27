// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'process_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProcessTypeModel {

 String get id; String get name; int get sequenceOrder; bool get isActive;
/// Create a copy of ProcessTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessTypeModelCopyWith<ProcessTypeModel> get copyWith => _$ProcessTypeModelCopyWithImpl<ProcessTypeModel>(this as ProcessTypeModel, _$identity);

  /// Serializes this ProcessTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProcessTypeModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessTypeModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.sequenceOrder, _this.sequenceOrder) || other.sequenceOrder == _this.sequenceOrder)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProcessTypeModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.sequenceOrder,_this.isActive);
}

@override
String toString() {
  final _this = this as ProcessTypeModel;
  return 'ProcessTypeModel(id: ${_this.id}, name: ${_this.name}, sequenceOrder: ${_this.sequenceOrder}, isActive: ${_this.isActive})';
}


}

/// @nodoc
abstract mixin class $ProcessTypeModelCopyWith<$Res>  {
  factory $ProcessTypeModelCopyWith(ProcessTypeModel value, $Res Function(ProcessTypeModel) _then) = _$ProcessTypeModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, int sequenceOrder, bool isActive
});




}
/// @nodoc
class _$ProcessTypeModelCopyWithImpl<$Res>
    implements $ProcessTypeModelCopyWith<$Res> {
  _$ProcessTypeModelCopyWithImpl(this._self, this._then);

  final ProcessTypeModel _self;
  final $Res Function(ProcessTypeModel) _then;

/// Create a copy of ProcessTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? sequenceOrder = null,Object? isActive = null,}) {
  return _then(ProcessTypeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sequenceOrder: null == sequenceOrder ? _self.sequenceOrder : sequenceOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProcessTypeModel].
extension ProcessTypeModelPatterns on ProcessTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProcessTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProcessTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProcessTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _ProcessTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProcessTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProcessTypeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int sequenceOrder,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProcessTypeModel() when $default != null:
return $default(_that.id,_that.name,_that.sequenceOrder,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int sequenceOrder,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _ProcessTypeModel():
return $default(_that.id,_that.name,_that.sequenceOrder,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int sequenceOrder,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _ProcessTypeModel() when $default != null:
return $default(_that.id,_that.name,_that.sequenceOrder,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProcessTypeModel implements ProcessTypeModel {
  const _ProcessTypeModel({required this.id, required this.name, required this.sequenceOrder, this.isActive = true});
  factory _ProcessTypeModel.fromJson(Map<String, dynamic> json) => _$ProcessTypeModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  int sequenceOrder;
@override@JsonKey() final  bool isActive;

/// Create a copy of ProcessTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessTypeModelCopyWith<_ProcessTypeModel> get copyWith => __$ProcessTypeModelCopyWithImpl<_ProcessTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcessTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sequenceOrder, sequenceOrder) || other.sequenceOrder == sequenceOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,sequenceOrder,isActive);
}

@override
String toString() {
    return 'ProcessTypeModel(id: $id, name: $name, sequenceOrder: $sequenceOrder, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$ProcessTypeModelCopyWith<$Res> implements $ProcessTypeModelCopyWith<$Res> {
  factory _$ProcessTypeModelCopyWith(_ProcessTypeModel value, $Res Function(_ProcessTypeModel) _then) = __$ProcessTypeModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int sequenceOrder, bool isActive
});




}
/// @nodoc
class __$ProcessTypeModelCopyWithImpl<$Res>
    implements _$ProcessTypeModelCopyWith<$Res> {
  __$ProcessTypeModelCopyWithImpl(this._self, this._then);

  final _ProcessTypeModel _self;
  final $Res Function(_ProcessTypeModel) _then;

/// Create a copy of ProcessTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? sequenceOrder = null,Object? isActive = null,}) {
  return _then(_ProcessTypeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sequenceOrder: null == sequenceOrder ? _self.sequenceOrder : sequenceOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
