import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_cart_response.g.dart';

@JsonSerializable()
class GetCartResponse {
  final String status, message;
  final int code;
  final Data data;

  const GetCartResponse({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  factory GetCartResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCartResponseFromJson(json);
}

@JsonSerializable()
class Data {
  final String id;
  final int itemCount;
  final num totalCartPrice;
  final List<CartItem> cartItems;

  const Data({
    required this.id,
    required this.itemCount,
    required this.totalCartPrice,
    required this.cartItems,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class CartItem {
  final num price;
  final Product product;

  const CartItem({required this.price, required this.product});

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}

@JsonSerializable()
class Product {
  final String id, title;
  final num price;
  final Owner owner;
  final Image coverImage;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.owner,
    required this.coverImage,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@JsonSerializable()
class Owner {
  final String id, name;

  const Owner({required this.id, required this.name});

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}

@JsonSerializable()
class Image {
  final String image;

  const Image({required this.image});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
