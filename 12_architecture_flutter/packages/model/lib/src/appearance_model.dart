import 'package:freezed_annotation/freezed_annotation.dart';

part 'appearance_model.freezed.dart';
part 'appearance_model.g.dart';

@freezed
class AppearanceModel with _$AppearanceModel {
  const factory AppearanceModel({
    @Default('No data') String gender,
    @Default('No data') String eyeColor,
    @Default('No data') String hairColor,
  }) = _AppearanceModel;

  factory AppearanceModel.fromJson(Map<String, dynamic> json) =>
      _$AppearanceModelFromJson(json);
}
