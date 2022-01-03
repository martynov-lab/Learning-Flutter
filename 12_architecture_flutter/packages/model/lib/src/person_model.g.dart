// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PersonModel _$$_PersonModelFromJson(Map<String, dynamic> json) =>
    _$_PersonModel(
      id: json['id'] as int,
      name: json['name'] as String,
      powerstats:
          PowerstatsModel.fromJson(json['powerstats'] as Map<String, dynamic>),
      appearance:
          AppearanceModel.fromJson(json['appearance'] as Map<String, dynamic>),
      biography:
          BiographyModel.fromJson(json['biography'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PersonModelToJson(_$_PersonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'powerstats': instance.powerstats.toJson(),
      'appearance': instance.appearance.toJson(),
      'biography': instance.biography.toJson(),
    };
