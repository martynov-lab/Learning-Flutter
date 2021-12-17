import 'package:domain/module_domain.dart';

class PowerstatsModel extends PowerstatsEntity {
  PowerstatsModel({
    required intelligence,
    required strength,
    required speed,
    required durability,
    required power,
    required combat,
  }) : super(
          intelligence: intelligence,
          strength: strength,
          speed: speed,
          durability: durability,
          power: power,
          combat: combat,
        );

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
