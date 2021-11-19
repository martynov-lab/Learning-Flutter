import 'package:json_annotation/json_annotation.dart';

part 'hotel_info.g.dart';

@JsonSerializable()
class HotelInfo {
  final String name;
  final HotelAddress address;
  final double rating;
  final HotelServis services;
  final List<String> photos;

  HotelInfo({this.name, this.rating, this.services, this.photos, this.address});

  factory HotelInfo.fromJson(Map<String, dynamic> json) =>
      _$HotelInfoFromJson(json);
  Map<String, dynamic> toJson() => _$HotelInfoToJson(this);
}

@JsonSerializable()
class HotelAddress {
  @JsonKey(defaultValue: "Страна не указана")
  final String country;
  @JsonKey(defaultValue: "Город не указана")
  final String city;
  @JsonKey(defaultValue: "Улица не указана")
  final String street;

  HotelAddress({this.country, this.city, this.street});
  factory HotelAddress.fromJson(Map<String, dynamic> json) =>
      _$HotelAddressFromJson(json);
  Map<String, dynamic> toJson() => _$HotelAddressToJson(this);
}

@JsonSerializable()
class HotelServis {
  final List<String> free;
  final List<String> paid;
  HotelServis({this.free, this.paid});

  factory HotelServis.fromJson(Map<String, dynamic> json) =>
      _$HotelServisFromJson(json);
  Map<String, dynamic> toJson() => _$HotelServisToJson(this);
}

//flutter packages pub run build_runner build
