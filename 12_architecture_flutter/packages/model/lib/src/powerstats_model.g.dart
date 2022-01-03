// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'powerstats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PowerstatsModel _$$_PowerstatsModelFromJson(Map<String, dynamic> json) =>
    _$_PowerstatsModel(
      intelligence: json['intelligence'] as int? ?? 0,
      strength: json['strength'] as int? ?? 0,
      speed: json['speed'] as int? ?? 0,
      durability: json['durability'] as int? ?? 0,
      power: json['power'] as int? ?? 0,
      combat: json['combat'] as int? ?? 0,
    );

Map<String, dynamic> _$$_PowerstatsModelToJson(_$_PowerstatsModel instance) =>
    <String, dynamic>{
      'intelligence': instance.intelligence,
      'strength': instance.strength,
      'speed': instance.speed,
      'durability': instance.durability,
      'power': instance.power,
      'combat': instance.combat,
    };
