import 'package:art_space_user/features/artworks/data/models/all_artwork_model.dart';
import 'package:art_space_user/features/artworks/ui/widgets/artwork_item.dart';
import 'package:art_space_user/features/profile/data/models/response/your_order_response.dart';
import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  final List<CartProduct> products;

  const CartItems({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (var i = 0; i < products.length; i++) ...[
              Container(
                width: 180.0,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ArtworkItem(
                  imageWidth: 180.0,
                  imageHeight: 150.0,
                  artworkModel: AllArtworkModel(
                    id: products[i].product.id,
                    title: products[i].product.title,
                    price: products[i].product.price.toString(),
                    image: products[i].product.coverImage.image,
                    ownerName: products[i].product.owner.name,
                    category: products[i].product.category,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
