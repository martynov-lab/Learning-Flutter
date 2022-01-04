import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/src/appearance_model.dart';
import 'package:model/src/biography_model.dart';
import 'package:model/src/powerstats_model.dart';

part 'person_model.freezed.dart';
part 'person_model.g.dart';

@freezed
class PersonModel with _$PersonModel {
  const factory PersonModel({
    required int id,
    required String name,
    required PowerstatsModel powerstats,
    required AppearanceModel appearance,
    required BiographyModel biography,
  }) = _PersonModel;

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);
}
