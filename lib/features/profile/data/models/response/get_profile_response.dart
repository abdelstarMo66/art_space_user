import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_profile_response.g.dart';

@JsonSerializable()
class GetProfileResponse {
  final String status, message;
  final int code;
  final Data data;

  const GetProfileResponse({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfileResponseFromJson(json);
}

@JsonSerializable()
class Data {
  final String id, name, email, phone, gender;
  final String? profileImg;
  final bool accountActive;
  final List<Address> addresses;

  const Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    this.profileImg,
    required this.accountActive,
    required this.addresses,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Address {
  final String id, alias, street, region, city, country;
  final String? postalCode, phone;

  const Address({
    required this.id,
    required this.alias,
    required this.street,
    required this.region,
    required this.city,
    required this.country,
    this.postalCode,
    this.phone,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
