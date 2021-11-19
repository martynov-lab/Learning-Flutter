// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelInfo _$HotelInfoFromJson(Map<String, dynamic> json) {
  return HotelInfo(
    name: json['name'] as String,
    rating: (json['rating'] as num)?.toDouble(),
    services: json['services'] == null
        ? null
        : HotelServis.fromJson(json['services'] as Map<String, dynamic>),
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    address: json['address'] == null
        ? null
        : HotelAddress.fromJson(json['address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HotelInfoToJson(HotelInfo instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'rating': instance.rating,
      'services': instance.services,
      'photos': instance.photos,
    };

HotelAddress _$HotelAddressFromJson(Map<String, dynamic> json) {
  return HotelAddress(
    country: json['country'] as String ?? 'Страна не указана',
    city: json['city'] as String ?? 'Город не указана',
    street: json['street'] as String ?? 'Улица не указана',
  );
}

Map<String, dynamic> _$HotelAddressToJson(HotelAddress instance) =>
    <String, dynamic>{
      'country': instance.country,
      'city': instance.city,
      'street': instance.street,
    };

HotelServis _$HotelServisFromJson(Map<String, dynamic> json) {
  return HotelServis(
    free: (json['free'] as List)?.map((e) => e as String)?.toList(),
    paid: (json['paid'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$HotelServisToJson(HotelServis instance) =>
    <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };
