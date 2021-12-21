// import 'package:json_annotation/json_annotation.dart';
// part 'powerstats_model.g.dart';

// @JsonSerializable()
class PowerstatsModel {
  final int intelligence;
  final int strength;
  final int speed;
  final int durability;
  final int power;
  final int combat;
  PowerstatsModel({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  factory PowerstatsModel.fromJson(json) {
    return PowerstatsModel(
      intelligence: json['intelligence'] as int,
      strength: json['strength'] as int,
      speed: json['speed'] as int,
      durability: json['durability'] as int,
      power: json['power'] as int,
      combat: json['combat'] as int,
    );
  }
}
