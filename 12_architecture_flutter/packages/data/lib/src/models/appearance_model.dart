// import 'package:json_annotation/json_annotation.dart';
// part 'appearance_model.g.dart';

class AppearanceModel {
  final String gender;
  //final String race;
  //final String height;
  //final String weight;
  final String eyeColor;
  final String hairColor;
  AppearanceModel({
    required this.gender,
    //required this.race,
    //required this.height,
    //required this.weight,
    required this.eyeColor,
    required this.hairColor,
  });

  factory AppearanceModel.fromJson(Map<String, dynamic> json) {
    return AppearanceModel(
      gender: json['gender'] as String,
      //race: json['race'] as String,
      //height: json['height'][1] as String,
      //weight: json['weight'][1] as String,
      eyeColor: json['eyeColor'] as String,
      hairColor: json['hairColor'] as String,
    );
  }
}
