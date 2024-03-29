import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_address_request_body.g.dart';

@JsonSerializable()
class AddAddressRequestBody {
  final String alias, street, region, city, country;
  final String? postalCode, phone;

  const AddAddressRequestBody({
    required this.alias,
    required this.street,
    required this.region,
    required this.city,
    required this.country,
    this.postalCode,
    this.phone,
  });

  Map<String, dynamic> toJson() => _$AddAddressRequestBodyToJson(this);
}
