import 'package:freezed_annotation/freezed_annotation.dart';

part 'your_orders_response.g.dart';

@JsonSerializable()
class YourOrdersResponse {
  final String message, status;
  final int code;
  final List<Orders> data;

  const YourOrdersResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory YourOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$YourOrdersResponseFromJson(json);
}

@JsonSerializable()
class Orders {
  final String id, paymentMethodType, orderState;
  final String? paidAt, deliveredAt;
  final num totalOrderPrice;
  final bool isPaid, isDelivered;
  final List<CartProduct> cartItems;

  const Orders({
    required this.id,
    required this.paymentMethodType,
    required this.orderState,
    required this.paidAt,
    required this.deliveredAt,
    required this.totalOrderPrice,
    required this.isPaid,
    required this.isDelivered,
    required this.cartItems,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);
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
