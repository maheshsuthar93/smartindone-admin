// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'printer_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrinterSettings {

 String get ipAddress; int get port; int get labelWidthMm; int get labelHeightMm;
/// Create a copy of PrinterSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrinterSettingsCopyWith<PrinterSettings> get copyWith => _$PrinterSettingsCopyWithImpl<PrinterSettings>(this as PrinterSettings, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PrinterSettings;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrinterSettings&&(identical(other.ipAddress, _this.ipAddress) || other.ipAddress == _this.ipAddress)&&(identical(other.port, _this.port) || other.port == _this.port)&&(identical(other.labelWidthMm, _this.labelWidthMm) || other.labelWidthMm == _this.labelWidthMm)&&(identical(other.labelHeightMm, _this.labelHeightMm) || other.labelHeightMm == _this.labelHeightMm));
}


@override
int get hashCode {
  final _this = this as PrinterSettings;
  return Object.hash(runtimeType,_this.ipAddress,_this.port,_this.labelWidthMm,_this.labelHeightMm);
}

@override
String toString() {
  final _this = this as PrinterSettings;
  return 'PrinterSettings(ipAddress: ${_this.ipAddress}, port: ${_this.port}, labelWidthMm: ${_this.labelWidthMm}, labelHeightMm: ${_this.labelHeightMm})';
}


}

/// @nodoc
abstract mixin class $PrinterSettingsCopyWith<$Res>  {
  factory $PrinterSettingsCopyWith(PrinterSettings value, $Res Function(PrinterSettings) _then) = _$PrinterSettingsCopyWithImpl;
@useResult
$Res call({
 String ipAddress, int port, int labelWidthMm, int labelHeightMm
});




}
/// @nodoc
class _$PrinterSettingsCopyWithImpl<$Res>
    implements $PrinterSettingsCopyWith<$Res> {
  _$PrinterSettingsCopyWithImpl(this._self, this._then);

  final PrinterSettings _self;
  final $Res Function(PrinterSettings) _then;

/// Create a copy of PrinterSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ipAddress = null,Object? port = null,Object? labelWidthMm = null,Object? labelHeightMm = null,}) {
  return _then(PrinterSettings(
ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,labelWidthMm: null == labelWidthMm ? _self.labelWidthMm : labelWidthMm // ignore: cast_nullable_to_non_nullable
as int,labelHeightMm: null == labelHeightMm ? _self.labelHeightMm : labelHeightMm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PrinterSettings].
extension PrinterSettingsPatterns on PrinterSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrinterSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrinterSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrinterSettings value)  $default,){
final _that = this;
switch (_that) {
case _PrinterSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrinterSettings value)?  $default,){
final _that = this;
switch (_that) {
case _PrinterSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ipAddress,  int port,  int labelWidthMm,  int labelHeightMm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrinterSettings() when $default != null:
return $default(_that.ipAddress,_that.port,_that.labelWidthMm,_that.labelHeightMm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ipAddress,  int port,  int labelWidthMm,  int labelHeightMm)  $default,) {final _that = this;
switch (_that) {
case _PrinterSettings():
return $default(_that.ipAddress,_that.port,_that.labelWidthMm,_that.labelHeightMm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ipAddress,  int port,  int labelWidthMm,  int labelHeightMm)?  $default,) {final _that = this;
switch (_that) {
case _PrinterSettings() when $default != null:
return $default(_that.ipAddress,_that.port,_that.labelWidthMm,_that.labelHeightMm);case _:
  return null;

}
}

}

/// @nodoc


class _PrinterSettings implements PrinterSettings {
  const _PrinterSettings({required this.ipAddress, required this.port, required this.labelWidthMm, required this.labelHeightMm});
  

@override final  String ipAddress;
@override final  int port;
@override final  int labelWidthMm;
@override final  int labelHeightMm;

/// Create a copy of PrinterSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrinterSettingsCopyWith<_PrinterSettings> get copyWith => __$PrinterSettingsCopyWithImpl<_PrinterSettings>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrinterSettings&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.port, port) || other.port == port)&&(identical(other.labelWidthMm, labelWidthMm) || other.labelWidthMm == labelWidthMm)&&(identical(other.labelHeightMm, labelHeightMm) || other.labelHeightMm == labelHeightMm));
}


@override
int get hashCode {
    return Object.hash(runtimeType,ipAddress,port,labelWidthMm,labelHeightMm);
}

@override
String toString() {
    return 'PrinterSettings(ipAddress: $ipAddress, port: $port, labelWidthMm: $labelWidthMm, labelHeightMm: $labelHeightMm)';
}


}

/// @nodoc
abstract mixin class _$PrinterSettingsCopyWith<$Res> implements $PrinterSettingsCopyWith<$Res> {
  factory _$PrinterSettingsCopyWith(_PrinterSettings value, $Res Function(_PrinterSettings) _then) = __$PrinterSettingsCopyWithImpl;
@override @useResult
$Res call({
 String ipAddress, int port, int labelWidthMm, int labelHeightMm
});




}
/// @nodoc
class __$PrinterSettingsCopyWithImpl<$Res>
    implements _$PrinterSettingsCopyWith<$Res> {
  __$PrinterSettingsCopyWithImpl(this._self, this._then);

  final _PrinterSettings _self;
  final $Res Function(_PrinterSettings) _then;

/// Create a copy of PrinterSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ipAddress = null,Object? port = null,Object? labelWidthMm = null,Object? labelHeightMm = null,}) {
  return _then(_PrinterSettings(
ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,labelWidthMm: null == labelWidthMm ? _self.labelWidthMm : labelWidthMm // ignore: cast_nullable_to_non_nullable
as int,labelHeightMm: null == labelHeightMm ? _self.labelHeightMm : labelHeightMm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
