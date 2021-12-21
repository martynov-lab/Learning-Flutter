// import 'package:json_annotation/json_annotation.dart';
import 'appearance_model.dart';
import 'biography_model.dart';
import 'powerstats_model.dart';

// part 'person_model.g.dart';

class PersonModel {
  final int id;
  final String name;
  final PowerstatsModel powerstats;
  final AppearanceModel appearance;
  final BiographyModel biography;
  final String work;
  final String relatives;
  final String images;

  PersonModel({
    required this.id,
    required this.name,
    required this.powerstats,
    required this.appearance,
    required this.biography,
    required this.work,
    required this.relatives,
    required this.images,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'] as int,
      name: json['name'] as String,
      powerstats: PowerstatsModel.fromJson(json['powerstats']),
      appearance:
          AppearanceModel.fromJson(json['appearance'] as Map<String, dynamic>),
      biography:
          BiographyModel.fromJson(json['biography'] as Map<String, dynamic>),
      work: json['work']['occupation'] as String,
      relatives: json['connections']['relatives'] as String,
      images: json['images']['lg'] as String,
    );
  }
}
