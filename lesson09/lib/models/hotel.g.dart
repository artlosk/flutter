// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelPreview _$HotelPreviewFromJson(Map<String, dynamic> json) {
  return HotelPreview(
    uuid: json['uuid'] as String,
    name: json['name'] as String,
    poster: json['poster'] as String,
  );
}

Map<String, dynamic> _$HotelPreviewToJson(HotelPreview instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
    };

HotelInfo _$HotelInfoFromJson(Map<String, dynamic> json) {
  return HotelInfo(
    name: json['name'] as String,
    poster: json['poster'] as String,
    address: json['address'] == null
        ? null
        : HotelAddress.fromJson(json['address'] as Map<String, dynamic>),
    rating: (json['rating'] as num)?.toDouble(),
    services: json['services'] == null
        ? null
        : HotelServices.fromJson(json['services'] as Map<String, dynamic>),
    photos: json['photos'] as List,
  );
}

Map<String, dynamic> _$HotelInfoToJson(HotelInfo instance) => <String, dynamic>{
      'name': instance.name,
      'poster': instance.poster,
      'rating': instance.rating,
      'address': instance.address?.toJson(),
      'services': instance.services?.toJson(),
      'photos': instance.photos,
    };

HotelAddress _$HotelAddressFromJson(Map<String, dynamic> json) {
  return HotelAddress(
    country: json['country'] as String,
    city: json['city'] as String,
    street: json['street'] as String,
  );
}

Map<String, dynamic> _$HotelAddressToJson(HotelAddress instance) =>
    <String, dynamic>{
      'country': instance.country,
      'city': instance.city,
      'street': instance.street,
    };

HotelServices _$HotelServicesFromJson(Map<String, dynamic> json) {
  return HotelServices(
    paid: json['paid'] as List,
    free: json['free'] as List,
  );
}

Map<String, dynamic> _$HotelServicesToJson(HotelServices instance) =>
    <String, dynamic>{
      'paid': instance.paid,
      'free': instance.free,
    };
