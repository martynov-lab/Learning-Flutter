import 'package:domain/module_domain.dart';

class BiographyModel extends BiographyEntity {
  BiographyModel({
    required fullName,
    required aliases,
    required placeOfBirth,
    required firstAppearance,
  }) : super(
          fullName: fullName,
          aliases: aliases,
          placeOfBirth: placeOfBirth,
          firstAppearance: firstAppearance,
        );

  factory BiographyModel.fromJson(Map<String, dynamic> json) {
    return BiographyModel(
      fullName: json['fullName'] as String,
      aliases: json['aliases'] as String,
      placeOfBirth: json['placeOfBirth'] as String,
      firstAppearance: json['firstAppearance'] as String,
    );
  }
}
