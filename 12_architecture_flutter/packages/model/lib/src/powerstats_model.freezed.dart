// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'powerstats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PowerstatsModel _$PowerstatsModelFromJson(Map<String, dynamic> json) {
  return _PowerstatsModel.fromJson(json);
}

/// @nodoc
class _$PowerstatsModelTearOff {
  const _$PowerstatsModelTearOff();

  _PowerstatsModel call(
      {int intelligence = 0,
      int strength = 0,
      int speed = 0,
      int durability = 0,
      int power = 0,
      int combat = 0}) {
    return _PowerstatsModel(
      intelligence: intelligence,
      strength: strength,
      speed: speed,
      durability: durability,
      power: power,
      combat: combat,
    );
  }

  PowerstatsModel fromJson(Map<String, Object?> json) {
    return PowerstatsModel.fromJson(json);
  }
}

/// @nodoc
const $PowerstatsModel = _$PowerstatsModelTearOff();

/// @nodoc
mixin _$PowerstatsModel {
  int get intelligence => throw _privateConstructorUsedError;
  int get strength => throw _privateConstructorUsedError;
  int get speed => throw _privateConstructorUsedError;
  int get durability => throw _privateConstructorUsedError;
  int get power => throw _privateConstructorUsedError;
  int get combat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PowerstatsModelCopyWith<PowerstatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PowerstatsModelCopyWith<$Res> {
  factory $PowerstatsModelCopyWith(
          PowerstatsModel value, $Res Function(PowerstatsModel) then) =
      _$PowerstatsModelCopyWithImpl<$Res>;
  $Res call(
      {int intelligence,
      int strength,
      int speed,
      int durability,
      int power,
      int combat});
}

/// @nodoc
class _$PowerstatsModelCopyWithImpl<$Res>
    implements $PowerstatsModelCopyWith<$Res> {
  _$PowerstatsModelCopyWithImpl(this._value, this._then);

  final PowerstatsModel _value;
  // ignore: unused_field
  final $Res Function(PowerstatsModel) _then;

  @override
  $Res call({
    Object? intelligence = freezed,
    Object? strength = freezed,
    Object? speed = freezed,
    Object? durability = freezed,
    Object? power = freezed,
    Object? combat = freezed,
  }) {
    return _then(_value.copyWith(
      intelligence: intelligence == freezed
          ? _value.intelligence
          : intelligence // ignore: cast_nullable_to_non_nullable
              as int,
      strength: strength == freezed
          ? _value.strength
          : strength // ignore: cast_nullable_to_non_nullable
              as int,
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
      durability: durability == freezed
          ? _value.durability
          : durability // ignore: cast_nullable_to_non_nullable
              as int,
      power: power == freezed
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as int,
      combat: combat == freezed
          ? _value.combat
          : combat // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$PowerstatsModelCopyWith<$Res>
    implements $PowerstatsModelCopyWith<$Res> {
  factory _$PowerstatsModelCopyWith(
          _PowerstatsModel value, $Res Function(_PowerstatsModel) then) =
      __$PowerstatsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int intelligence,
      int strength,
      int speed,
      int durability,
      int power,
      int combat});
}

/// @nodoc
class __$PowerstatsModelCopyWithImpl<$Res>
    extends _$PowerstatsModelCopyWithImpl<$Res>
    implements _$PowerstatsModelCopyWith<$Res> {
  __$PowerstatsModelCopyWithImpl(
      _PowerstatsModel _value, $Res Function(_PowerstatsModel) _then)
      : super(_value, (v) => _then(v as _PowerstatsModel));

  @override
  _PowerstatsModel get _value => super._value as _PowerstatsModel;

  @override
  $Res call({
    Object? intelligence = freezed,
    Object? strength = freezed,
    Object? speed = freezed,
    Object? durability = freezed,
    Object? power = freezed,
    Object? combat = freezed,
  }) {
    return _then(_PowerstatsModel(
      intelligence: intelligence == freezed
          ? _value.intelligence
          : intelligence // ignore: cast_nullable_to_non_nullable
              as int,
      strength: strength == freezed
          ? _value.strength
          : strength // ignore: cast_nullable_to_non_nullable
              as int,
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
      durability: durability == freezed
          ? _value.durability
          : durability // ignore: cast_nullable_to_non_nullable
              as int,
      power: power == freezed
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as int,
      combat: combat == freezed
          ? _value.combat
          : combat // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PowerstatsModel implements _PowerstatsModel {
  const _$_PowerstatsModel(
      {this.intelligence = 0,
      this.strength = 0,
      this.speed = 0,
      this.durability = 0,
      this.power = 0,
      this.combat = 0});

  factory _$_PowerstatsModel.fromJson(Map<String, dynamic> json) =>
      _$$_PowerstatsModelFromJson(json);

  @JsonKey()
  @override
  final int intelligence;
  @JsonKey()
  @override
  final int strength;
  @JsonKey()
  @override
  final int speed;
  @JsonKey()
  @override
  final int durability;
  @JsonKey()
  @override
  final int power;
  @JsonKey()
  @override
  final int combat;

  @override
  String toString() {
    return 'PowerstatsModel(intelligence: $intelligence, strength: $strength, speed: $speed, durability: $durability, power: $power, combat: $combat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PowerstatsModel &&
            const DeepCollectionEquality()
                .equals(other.intelligence, intelligence) &&
            const DeepCollectionEquality().equals(other.strength, strength) &&
            const DeepCollectionEquality().equals(other.speed, speed) &&
            const DeepCollectionEquality()
                .equals(other.durability, durability) &&
            const DeepCollectionEquality().equals(other.power, power) &&
            const DeepCollectionEquality().equals(other.combat, combat));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(intelligence),
      const DeepCollectionEquality().hash(strength),
      const DeepCollectionEquality().hash(speed),
      const DeepCollectionEquality().hash(durability),
      const DeepCollectionEquality().hash(power),
      const DeepCollectionEquality().hash(combat));

  @JsonKey(ignore: true)
  @override
  _$PowerstatsModelCopyWith<_PowerstatsModel> get copyWith =>
      __$PowerstatsModelCopyWithImpl<_PowerstatsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PowerstatsModelToJson(this);
  }
}

abstract class _PowerstatsModel implements PowerstatsModel {
  const factory _PowerstatsModel(
      {int intelligence,
      int strength,
      int speed,
      int durability,
      int power,
      int combat}) = _$_PowerstatsModel;

  factory _PowerstatsModel.fromJson(Map<String, dynamic> json) =
      _$_PowerstatsModel.fromJson;

  @override
  int get intelligence;
  @override
  int get strength;
  @override
  int get speed;
  @override
  int get durability;
  @override
  int get power;
  @override
  int get combat;
  @override
  @JsonKey(ignore: true)
  _$PowerstatsModelCopyWith<_PowerstatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
