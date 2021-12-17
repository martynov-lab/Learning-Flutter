import 'package:domain/module_domain.dart';

class AppearanceModel extends AppearanceEntity {
  AppearanceModel({
    required gender,
    required race,
    required height,
    required weight,
    required eyeColor,
    required hairColor,
  }) : super(
          gender: gender,
          race: race,
          height: height,
          weight: weight,
          eyeColor: eyeColor,
          hairColor: hairColor,
        );

  factory AppearanceModel.fromJson(Map<String, dynamic> json) {
    return AppearanceModel(
      gender: json['gender'] as String,
      race: json['race'] as String,
      height: json['height'] as String,
      weight: json['weight'] as String,
      eyeColor: json['eyeColor'] as String,
      hairColor: json['hairColor'] as String,
    );
  }
}
