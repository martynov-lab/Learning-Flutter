// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'person_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PersonModel _$PersonModelFromJson(Map<String, dynamic> json) {
  return _PersonModel.fromJson(json);
}

/// @nodoc
class _$PersonModelTearOff {
  const _$PersonModelTearOff();

  _PersonModel call(
      {required int id,
      required String name,
      required PowerstatsModel powerstats,
      required AppearanceModel appearance,
      required BiographyModel biography}) {
    return _PersonModel(
      id: id,
      name: name,
      powerstats: powerstats,
      appearance: appearance,
      biography: biography,
    );
  }

  PersonModel fromJson(Map<String, Object?> json) {
    return PersonModel.fromJson(json);
  }
}

/// @nodoc
const $PersonModel = _$PersonModelTearOff();

/// @nodoc
mixin _$PersonModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  PowerstatsModel get powerstats => throw _privateConstructorUsedError;
  AppearanceModel get appearance => throw _privateConstructorUsedError;
  BiographyModel get biography => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonModelCopyWith<PersonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonModelCopyWith<$Res> {
  factory $PersonModelCopyWith(
          PersonModel value, $Res Function(PersonModel) then) =
      _$PersonModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      PowerstatsModel powerstats,
      AppearanceModel appearance,
      BiographyModel biography});

  $PowerstatsModelCopyWith<$Res> get powerstats;
  $AppearanceModelCopyWith<$Res> get appearance;
  $BiographyModelCopyWith<$Res> get biography;
}

/// @nodoc
class _$PersonModelCopyWithImpl<$Res> implements $PersonModelCopyWith<$Res> {
  _$PersonModelCopyWithImpl(this._value, this._then);

  final PersonModel _value;
  // ignore: unused_field
  final $Res Function(PersonModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? powerstats = freezed,
    Object? appearance = freezed,
    Object? biography = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      powerstats: powerstats == freezed
          ? _value.powerstats
          : powerstats // ignore: cast_nullable_to_non_nullable
              as PowerstatsModel,
      appearance: appearance == freezed
          ? _value.appearance
          : appearance // ignore: cast_nullable_to_non_nullable
              as AppearanceModel,
      biography: biography == freezed
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as BiographyModel,
    ));
  }

  @override
  $PowerstatsModelCopyWith<$Res> get powerstats {
    return $PowerstatsModelCopyWith<$Res>(_value.powerstats, (value) {
      return _then(_value.copyWith(powerstats: value));
    });
  }

  @override
  $AppearanceModelCopyWith<$Res> get appearance {
    return $AppearanceModelCopyWith<$Res>(_value.appearance, (value) {
      return _then(_value.copyWith(appearance: value));
    });
  }

  @override
  $BiographyModelCopyWith<$Res> get biography {
    return $BiographyModelCopyWith<$Res>(_value.biography, (value) {
      return _then(_value.copyWith(biography: value));
    });
  }
}

/// @nodoc
abstract class _$PersonModelCopyWith<$Res>
    implements $PersonModelCopyWith<$Res> {
  factory _$PersonModelCopyWith(
          _PersonModel value, $Res Function(_PersonModel) then) =
      __$PersonModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      PowerstatsModel powerstats,
      AppearanceModel appearance,
      BiographyModel biography});

  @override
  $PowerstatsModelCopyWith<$Res> get powerstats;
  @override
  $AppearanceModelCopyWith<$Res> get appearance;
  @override
  $BiographyModelCopyWith<$Res> get biography;
}

/// @nodoc
class __$PersonModelCopyWithImpl<$Res> extends _$PersonModelCopyWithImpl<$Res>
    implements _$PersonModelCopyWith<$Res> {
  __$PersonModelCopyWithImpl(
      _PersonModel _value, $Res Function(_PersonModel) _then)
      : super(_value, (v) => _then(v as _PersonModel));

  @override
  _PersonModel get _value => super._value as _PersonModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? powerstats = freezed,
    Object? appearance = freezed,
    Object? biography = freezed,
  }) {
    return _then(_PersonModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      powerstats: powerstats == freezed
          ? _value.powerstats
          : powerstats // ignore: cast_nullable_to_non_nullable
              as PowerstatsModel,
      appearance: appearance == freezed
          ? _value.appearance
          : appearance // ignore: cast_nullable_to_non_nullable
              as AppearanceModel,
      biography: biography == freezed
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as BiographyModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PersonModel implements _PersonModel {
  const _$_PersonModel(
      {required this.id,
      required this.name,
      required this.powerstats,
      required this.appearance,
      required this.biography});

  factory _$_PersonModel.fromJson(Map<String, dynamic> json) =>
      _$$_PersonModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final PowerstatsModel powerstats;
  @override
  final AppearanceModel appearance;
  @override
  final BiographyModel biography;

  @override
  String toString() {
    return 'PersonModel(id: $id, name: $name, powerstats: $powerstats, appearance: $appearance, biography: $biography)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PersonModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.powerstats, powerstats) &&
            const DeepCollectionEquality()
                .equals(other.appearance, appearance) &&
            const DeepCollectionEquality().equals(other.biography, biography));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(powerstats),
      const DeepCollectionEquality().hash(appearance),
      const DeepCollectionEquality().hash(biography));

  @JsonKey(ignore: true)
  @override
  _$PersonModelCopyWith<_PersonModel> get copyWith =>
      __$PersonModelCopyWithImpl<_PersonModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PersonModelToJson(this);
  }
}

abstract class _PersonModel implements PersonModel {
  const factory _PersonModel(
      {required int id,
      required String name,
      required PowerstatsModel powerstats,
      required AppearanceModel appearance,
      required BiographyModel biography}) = _$_PersonModel;

  factory _PersonModel.fromJson(Map<String, dynamic> json) =
      _$_PersonModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  PowerstatsModel get powerstats;
  @override
  AppearanceModel get appearance;
  @override
  BiographyModel get biography;
  @override
  @JsonKey(ignore: true)
  _$PersonModelCopyWith<_PersonModel> get copyWith =>
      throw _privateConstructorUsedError;
}
