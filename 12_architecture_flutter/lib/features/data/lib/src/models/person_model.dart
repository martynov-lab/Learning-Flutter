import 'package:data/src/models/appearance_model.dart';
import 'package:data/src/models/biography_model.dart';
import 'package:data/src/models/powerstats_model.dart';
import 'package:domain/module_domain.dart';

class PersonModel extends PersonEntity {
  const PersonModel({
    required id,
    required name,
    required powerstats,
    required appearance,
    required biography,
    required work,
    required relatives,
    required images,
  }) : super(
          id: id,
          name: name,
          powerstats: powerstats,
          appearance: appearance,
          biography: biography,
          work: work,
          relatives: relatives,
          images: images,
        );

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'] as int,
      name: json['name'] as String,
      powerstats: json['powerstats'] != null
          ? PowerstatsModel.fromJson(json['powerstats'])
          : null,
      appearance: json['appearance'] != null
          ? AppearanceModel.fromJson(json['appearance'])
          : null,
      biography: json['biography'] != null
          ? BiographyModel.fromJson(json['biography'])
          : null,
      work: json['work']['occupation'] as String,
      relatives: json['connections']['relatives'] as String,
      images: json['images']['lg'] as String,
    );
  }
}
