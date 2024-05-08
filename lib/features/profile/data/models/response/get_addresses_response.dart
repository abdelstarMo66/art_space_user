import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_addresses_response.g.dart';

@JsonSerializable()
class GetAddressResponse {
  final String message, status;
  final int code;
  final List<AddressData> data;

  const GetAddressResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory GetAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAddressResponseFromJson(json);
}

@JsonSerializable()
class AddressData {
  final String id, alias, street, region, city, country, postalCode, phone;

  const AddressData({
    required this.id,
    required this.alias,
    required this.street,
    required this.region,
    required this.city,
    required this.country,
    required this.postalCode,
    required this.phone,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) =>
      _$AddressDataFromJson(json);
}
