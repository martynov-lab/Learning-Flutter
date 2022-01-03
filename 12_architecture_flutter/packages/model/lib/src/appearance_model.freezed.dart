// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'appearance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppearanceModel _$AppearanceModelFromJson(Map<String, dynamic> json) {
  return _AppearanceModel.fromJson(json);
}

/// @nodoc
class _$AppearanceModelTearOff {
  const _$AppearanceModelTearOff();

  _AppearanceModel call(
      {String gender = 'No data',
      String eyeColor = 'No data',
      String hairColor = 'No data'}) {
    return _AppearanceModel(
      gender: gender,
      eyeColor: eyeColor,
      hairColor: hairColor,
    );
  }

  AppearanceModel fromJson(Map<String, Object?> json) {
    return AppearanceModel.fromJson(json);
  }
}

/// @nodoc
const $AppearanceModel = _$AppearanceModelTearOff();

/// @nodoc
mixin _$AppearanceModel {
  String get gender => throw _privateConstructorUsedError;
  String get eyeColor => throw _privateConstructorUsedError;
  String get hairColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppearanceModelCopyWith<AppearanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppearanceModelCopyWith<$Res> {
  factory $AppearanceModelCopyWith(
          AppearanceModel value, $Res Function(AppearanceModel) then) =
      _$AppearanceModelCopyWithImpl<$Res>;
  $Res call({String gender, String eyeColor, String hairColor});
}

/// @nodoc
class _$AppearanceModelCopyWithImpl<$Res>
    implements $AppearanceModelCopyWith<$Res> {
  _$AppearanceModelCopyWithImpl(this._value, this._then);

  final AppearanceModel _value;
  // ignore: unused_field
  final $Res Function(AppearanceModel) _then;

  @override
  $Res call({
    Object? gender = freezed,
    Object? eyeColor = freezed,
    Object? hairColor = freezed,
  }) {
    return _then(_value.copyWith(
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      eyeColor: eyeColor == freezed
          ? _value.eyeColor
          : eyeColor // ignore: cast_nullable_to_non_nullable
              as String,
      hairColor: hairColor == freezed
          ? _value.hairColor
          : hairColor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AppearanceModelCopyWith<$Res>
    implements $AppearanceModelCopyWith<$Res> {
  factory _$AppearanceModelCopyWith(
          _AppearanceModel value, $Res Function(_AppearanceModel) then) =
      __$AppearanceModelCopyWithImpl<$Res>;
  @override
  $Res call({String gender, String eyeColor, String hairColor});
}

/// @nodoc
class __$AppearanceModelCopyWithImpl<$Res>
    extends _$AppearanceModelCopyWithImpl<$Res>
    implements _$AppearanceModelCopyWith<$Res> {
  __$AppearanceModelCopyWithImpl(
      _AppearanceModel _value, $Res Function(_AppearanceModel) _then)
      : super(_value, (v) => _then(v as _AppearanceModel));

  @override
  _AppearanceModel get _value => super._value as _AppearanceModel;

  @override
  $Res call({
    Object? gender = freezed,
    Object? eyeColor = freezed,
    Object? hairColor = freezed,
  }) {
    return _then(_AppearanceModel(
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      eyeColor: eyeColor == freezed
          ? _value.eyeColor
          : eyeColor // ignore: cast_nullable_to_non_nullable
              as String,
      hairColor: hairColor == freezed
          ? _value.hairColor
          : hairColor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppearanceModel implements _AppearanceModel {
  const _$_AppearanceModel(
      {this.gender = 'No data',
      this.eyeColor = 'No data',
      this.hairColor = 'No data'});

  factory _$_AppearanceModel.fromJson(Map<String, dynamic> json) =>
      _$$_AppearanceModelFromJson(json);

  @JsonKey()
  @override
  final String gender;
  @JsonKey()
  @override
  final String eyeColor;
  @JsonKey()
  @override
  final String hairColor;

  @override
  String toString() {
    return 'AppearanceModel(gender: $gender, eyeColor: $eyeColor, hairColor: $hairColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppearanceModel &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.eyeColor, eyeColor) &&
            const DeepCollectionEquality().equals(other.hairColor, hairColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(eyeColor),
      const DeepCollectionEquality().hash(hairColor));

  @JsonKey(ignore: true)
  @override
  _$AppearanceModelCopyWith<_AppearanceModel> get copyWith =>
      __$AppearanceModelCopyWithImpl<_AppearanceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppearanceModelToJson(this);
  }
}

abstract class _AppearanceModel implements AppearanceModel {
  const factory _AppearanceModel(
      {String gender, String eyeColor, String hairColor}) = _$_AppearanceModel;

  factory _AppearanceModel.fromJson(Map<String, dynamic> json) =
      _$_AppearanceModel.fromJson;

  @override
  String get gender;
  @override
  String get eyeColor;
  @override
  String get hairColor;
  @override
  @JsonKey(ignore: true)
  _$AppearanceModelCopyWith<_AppearanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
