import 'package:hotels/views/hotel_info_view.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelPreview {
  final String uuid;
  final String name;
  final String poster;

  HotelPreview({this.uuid, this.name, this.poster});

  // HotelPreview.fromJson(Map<String, dynamic> json)
  // : this(
  //   uuid: json['uuid'],
  //   name: json['name'],
  //   poster: json['poster']
  // );

  factory HotelPreview.fromJson(Map<String, dynamic> json) =>
      _$HotelPreviewFromJson(json);

  Map<String, dynamic> toJson() => _$HotelPreviewToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelInfo {
  final String name;
  final String poster;
  final double rating;
  final HotelAddress address;
  final HotelServices services;
  final List photos;

  HotelInfo({
    this.name,
    this.poster,
    this.address,
    this.rating,
    this.services,
    this.photos
  });

  // HotelInfo.fromJson(Map<String, dynamic>json):
  //   this(name: json.toString(), poster: json.toString());


factory HotelInfo.fromJson(Map<String, dynamic> json) =>
    _$HotelInfoFromJson(json);

Map<String, dynamic> toJson() => _$HotelInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelAddress {
  final String country;
  final String city;
  final String street;

  HotelAddress({
    this.country,
    this.city,
    this.street,
  });

  factory HotelAddress.fromJson(Map<String, dynamic> json) =>
      _$HotelAddressFromJson(json);

  Map<String, dynamic> toJson() => _$HotelAddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelServices {
  final List paid;
  final List free;

  HotelServices({
    this.paid,
    this.free,
  });

  factory HotelServices.fromJson(Map<String, dynamic> json) =>
      _$HotelServicesFromJson(json);

  Map<String, dynamic> toJson() => _$HotelServicesToJson(this);
}

