class BidModel {
  final String user;
  final num price;

  const BidModel({required this.user, required this.price});

  factory BidModel.fromJson(Map<String, dynamic> json) {
    return BidModel(
      user: json["user"],
      price: json["price"],
    );
  }
}
