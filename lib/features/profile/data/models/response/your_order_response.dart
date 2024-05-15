import 'package:freezed_annotation/freezed_annotation.dart';

part 'your_order_response.g.dart';

@JsonSerializable()
class YourOrderResponse {
  final String message, status;
  final int code;
  final Order data;

  const YourOrderResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory YourOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$YourOrderResponseFromJson(json);
}

@JsonSerializable()
class Order {
  final String id, paymentMethodType, orderState, currency;
  final String? paidAt, deliveredAt;
  final num totalOrderPrice;
  final bool isPaid, isDelivered;
  final ShippingAddress shippingAddress;
  final List<CartProduct> cartItems;

  const Order({
    required this.id,
    required this.paymentMethodType,
    required this.orderState,
    required this.paidAt,
    required this.deliveredAt,
    required this.totalOrderPrice,
    required this.isPaid,
    required this.isDelivered,
    required this.shippingAddress,
    required this.cartItems,
    required this.currency,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@JsonSerializable()
class ShippingAddress {
  final String alias, street, region, city, country;
  final String? postalCode, phone;

  const ShippingAddress({
    required this.alias,
    required this.street,
    required this.region,
    required this.city,
    required this.country,
    required this.postalCode,
    required this.phone,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);
}

@JsonSerializable()
class CartProduct {
  final Product product;
  final num price;

  const CartProduct({required this.product, required this.price});

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);
}

@JsonSerializable()
class Product {
  final String id, title, category;
  final num price;
  final Owner owner;
  final CoverImage coverImage;

  const Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.owner,
    required this.coverImage,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@JsonSerializable()
class Owner {
  final String id, name, profileImg;

  const Owner({
    required this.id,
    required this.name,
    required this.profileImg,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}

@JsonSerializable()
class CoverImage {
  final String image;

  const CoverImage({required this.image});

  factory CoverImage.fromJson(Map<String, dynamic> json) =>
      _$CoverImageFromJson(json);
}
