import 'package:freezed_annotation/freezed_annotation.dart';

part 'powerstats_model.freezed.dart';
part 'powerstats_model.g.dart';

@freezed
class PowerstatsModel with _$PowerstatsModel {
  const factory PowerstatsModel({
    @Default(0) int intelligence,
    @Default(0) int strength,
    @Default(0) int speed,
    @Default(0) int durability,
    @Default(0) int power,
    @Default(0) int combat,
  }) = _PowerstatsModel;

  factory PowerstatsModel.fromJson(Map<String, dynamic> json) =>
      _$PowerstatsModelFromJson(json);
}
