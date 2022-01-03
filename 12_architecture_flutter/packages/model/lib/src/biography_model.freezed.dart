// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'biography_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BiographyModel _$BiographyModelFromJson(Map<String, dynamic> json) {
  return _BiographyModel.fromJson(json);
}

/// @nodoc
class _$BiographyModelTearOff {
  const _$BiographyModelTearOff();

  _BiographyModel call(
      {String fullName = 'No data',
      String placeOfBirth = 'No data',
      String firstAppearance = 'No data'}) {
    return _BiographyModel(
      fullName: fullName,
      placeOfBirth: placeOfBirth,
      firstAppearance: firstAppearance,
    );
  }

  BiographyModel fromJson(Map<String, Object?> json) {
    return BiographyModel.fromJson(json);
  }
}

/// @nodoc
const $BiographyModel = _$BiographyModelTearOff();

/// @nodoc
mixin _$BiographyModel {
  String get fullName => throw _privateConstructorUsedError;
  String get placeOfBirth => throw _privateConstructorUsedError;
  String get firstAppearance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BiographyModelCopyWith<BiographyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BiographyModelCopyWith<$Res> {
  factory $BiographyModelCopyWith(
          BiographyModel value, $Res Function(BiographyModel) then) =
      _$BiographyModelCopyWithImpl<$Res>;
  $Res call({String fullName, String placeOfBirth, String firstAppearance});
}

/// @nodoc
class _$BiographyModelCopyWithImpl<$Res>
    implements $BiographyModelCopyWith<$Res> {
  _$BiographyModelCopyWithImpl(this._value, this._then);

  final BiographyModel _value;
  // ignore: unused_field
  final $Res Function(BiographyModel) _then;

  @override
  $Res call({
    Object? fullName = freezed,
    Object? placeOfBirth = freezed,
    Object? firstAppearance = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      placeOfBirth: placeOfBirth == freezed
          ? _value.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      firstAppearance: firstAppearance == freezed
          ? _value.firstAppearance
          : firstAppearance // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BiographyModelCopyWith<$Res>
    implements $BiographyModelCopyWith<$Res> {
  factory _$BiographyModelCopyWith(
          _BiographyModel value, $Res Function(_BiographyModel) then) =
      __$BiographyModelCopyWithImpl<$Res>;
  @override
  $Res call({String fullName, String placeOfBirth, String firstAppearance});
}

/// @nodoc
class __$BiographyModelCopyWithImpl<$Res>
    extends _$BiographyModelCopyWithImpl<$Res>
    implements _$BiographyModelCopyWith<$Res> {
  __$BiographyModelCopyWithImpl(
      _BiographyModel _value, $Res Function(_BiographyModel) _then)
      : super(_value, (v) => _then(v as _BiographyModel));

  @override
  _BiographyModel get _value => super._value as _BiographyModel;

  @override
  $Res call({
    Object? fullName = freezed,
    Object? placeOfBirth = freezed,
    Object? firstAppearance = freezed,
  }) {
    return _then(_BiographyModel(
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      placeOfBirth: placeOfBirth == freezed
          ? _value.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      firstAppearance: firstAppearance == freezed
          ? _value.firstAppearance
          : firstAppearance // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BiographyModel implements _BiographyModel {
  const _$_BiographyModel(
      {this.fullName = 'No data',
      this.placeOfBirth = 'No data',
      this.firstAppearance = 'No data'});

  factory _$_BiographyModel.fromJson(Map<String, dynamic> json) =>
      _$$_BiographyModelFromJson(json);

  @JsonKey()
  @override
  final String fullName;
  @JsonKey()
  @override
  final String placeOfBirth;
  @JsonKey()
  @override
  final String firstAppearance;

  @override
  String toString() {
    return 'BiographyModel(fullName: $fullName, placeOfBirth: $placeOfBirth, firstAppearance: $firstAppearance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BiographyModel &&
            const DeepCollectionEquality().equals(other.fullName, fullName) &&
            const DeepCollectionEquality()
                .equals(other.placeOfBirth, placeOfBirth) &&
            const DeepCollectionEquality()
                .equals(other.firstAppearance, firstAppearance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fullName),
      const DeepCollectionEquality().hash(placeOfBirth),
      const DeepCollectionEquality().hash(firstAppearance));

  @JsonKey(ignore: true)
  @override
  _$BiographyModelCopyWith<_BiographyModel> get copyWith =>
      __$BiographyModelCopyWithImpl<_BiographyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BiographyModelToJson(this);
  }
}

abstract class _BiographyModel implements BiographyModel {
  const factory _BiographyModel(
      {String fullName,
      String placeOfBirth,
      String firstAppearance}) = _$_BiographyModel;

  factory _BiographyModel.fromJson(Map<String, dynamic> json) =
      _$_BiographyModel.fromJson;

  @override
  String get fullName;
  @override
  String get placeOfBirth;
  @override
  String get firstAppearance;
  @override
  @JsonKey(ignore: true)
  _$BiographyModelCopyWith<_BiographyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
