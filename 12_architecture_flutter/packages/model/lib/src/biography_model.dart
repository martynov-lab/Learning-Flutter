import 'package:freezed_annotation/freezed_annotation.dart';

part 'biography_model.freezed.dart';
part 'biography_model.g.dart';

@freezed
class BiographyModel with _$BiographyModel {
  const factory BiographyModel({
    @Default('No data') String fullName,
    @Default('No data') String placeOfBirth,
    @Default('No data') String firstAppearance,
  }) = _BiographyModel;

  factory BiographyModel.fromJson(Map<String, dynamic> json) =>
      _$BiographyModelFromJson(json);
}
