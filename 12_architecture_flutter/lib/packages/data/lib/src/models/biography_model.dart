// import 'package:json_annotation/json_annotation.dart';
// part 'biography_model.g.dart';

class BiographyModel {
  final String fullName;
  //final List<String> aliases;
  final String placeOfBirth;
  final String firstAppearance;
  BiographyModel({
    required this.fullName,
    //required this.aliases,
    required this.placeOfBirth,
    required this.firstAppearance,
  });

  factory BiographyModel.fromJson(Map<String, dynamic> json) {
    return BiographyModel(
      fullName: json['fullName'] as String,
      //aliases: json['aliases'] as List<String>,
      placeOfBirth: json['placeOfBirth'] as String,
      firstAppearance: json['firstAppearance'] as String,
    );
  }
}
