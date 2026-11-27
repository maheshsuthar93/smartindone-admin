// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_analytics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectAnalyticsModel {

 int get total; int get active; int get completed;
/// Create a copy of ProjectAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectAnalyticsModelCopyWith<ProjectAnalyticsModel> get copyWith => _$ProjectAnalyticsModelCopyWithImpl<ProjectAnalyticsModel>(this as ProjectAnalyticsModel, _$identity);

  /// Serializes this ProjectAnalyticsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProjectAnalyticsModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectAnalyticsModel&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.completed, _this.completed) || other.completed == _this.completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProjectAnalyticsModel;
  return Object.hash(runtimeType,_this.total,_this.active,_this.completed);
}

@override
String toString() {
  final _this = this as ProjectAnalyticsModel;
  return 'ProjectAnalyticsModel(total: ${_this.total}, active: ${_this.active}, completed: ${_this.completed})';
}


}

/// @nodoc
abstract mixin class $ProjectAnalyticsModelCopyWith<$Res>  {
  factory $ProjectAnalyticsModelCopyWith(ProjectAnalyticsModel value, $Res Function(ProjectAnalyticsModel) _then) = _$ProjectAnalyticsModelCopyWithImpl;
@useResult
$Res call({
 int total, int active, int completed
});




}
/// @nodoc
class _$ProjectAnalyticsModelCopyWithImpl<$Res>
    implements $ProjectAnalyticsModelCopyWith<$Res> {
  _$ProjectAnalyticsModelCopyWithImpl(this._self, this._then);

  final ProjectAnalyticsModel _self;
  final $Res Function(ProjectAnalyticsModel) _then;

/// Create a copy of ProjectAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? active = null,Object? completed = null,}) {
  return _then(ProjectAnalyticsModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectAnalyticsModel].
extension ProjectAnalyticsModelPatterns on ProjectAnalyticsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectAnalyticsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectAnalyticsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectAnalyticsModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectAnalyticsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectAnalyticsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectAnalyticsModel() when $default != null:
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
case _ProjectAnalyticsModel() when $default != null:
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
case _ProjectAnalyticsModel():
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
case _ProjectAnalyticsModel() when $default != null:
return $default(_that.total,_that.active,_that.completed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectAnalyticsModel implements ProjectAnalyticsModel {
  const _ProjectAnalyticsModel({required this.total, required this.active, required this.completed});
  factory _ProjectAnalyticsModel.fromJson(Map<String, dynamic> json) => _$ProjectAnalyticsModelFromJson(json);

@override final  int total;
@override final  int active;
@override final  int completed;

/// Create a copy of ProjectAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectAnalyticsModelCopyWith<_ProjectAnalyticsModel> get copyWith => __$ProjectAnalyticsModelCopyWithImpl<_ProjectAnalyticsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectAnalyticsModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectAnalyticsModel&&(identical(other.total, total) || other.total == total)&&(identical(other.active, active) || other.active == active)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,total,active,completed);
}

@override
String toString() {
    return 'ProjectAnalyticsModel(total: $total, active: $active, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$ProjectAnalyticsModelCopyWith<$Res> implements $ProjectAnalyticsModelCopyWith<$Res> {
  factory _$ProjectAnalyticsModelCopyWith(_ProjectAnalyticsModel value, $Res Function(_ProjectAnalyticsModel) _then) = __$ProjectAnalyticsModelCopyWithImpl;
@override @useResult
$Res call({
 int total, int active, int completed
});




}
/// @nodoc
class __$ProjectAnalyticsModelCopyWithImpl<$Res>
    implements _$ProjectAnalyticsModelCopyWith<$Res> {
  __$ProjectAnalyticsModelCopyWithImpl(this._self, this._then);

  final _ProjectAnalyticsModel _self;
  final $Res Function(_ProjectAnalyticsModel) _then;

/// Create a copy of ProjectAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? active = null,Object? completed = null,}) {
  return _then(_ProjectAnalyticsModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
