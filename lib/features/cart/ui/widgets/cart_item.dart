import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:art_space_user/features/cart/logic/cart_cubit.dart';
import 'package:art_space_user/features/cart/logic/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/response/get_cart_response.dart';

class CartItem extends StatelessWidget {
  final Product product;

  const CartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: GestureDetector(
        onTap: () => context.pushNamed(Routes.artworkDetails, arguments: product.id),
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          color: ColorManager.moreLightGray,
          elevation: 0.2,
          shadowColor: ColorManager.transparent,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(12.0),
                    bottomStart: Radius.circular(12.0),
                  ),
                  child: AppNetworkImage(
                    image: product.coverImage.image,
                    height: double.maxFinite,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    end: 8.0,
                    start: 12.0,
                    top: 8.0,
                    bottom: 4.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleManager.font24OLightBlackSemiBold,
                      ),
                      Text(
                        product.owner.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleManager.font16DarkPurpleSemiBold,
                      ),
                      Row(
                        children: [
                          Text(
                            "💵 ${product.price.toDouble()}",
                            textAlign: TextAlign.center,
                            style: TextStyleManager.font20DarkPurpleSemiBold,
                          ),
                          const Spacer(),
                          BlocListener<CartCubit, CartStates>(
                            listener: (context, state) {
                              if (state is DeleteCartSuccessState) {
                                AnimatedSnackBar.material(
                                  state.deleteCartResponse.message,
                                  type: AnimatedSnackBarType.success,
                                  animationCurve: Curves.fastEaseInToSlowEaseOut,
                                  mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                                ).show(context);
                              }
                              if (state is DeleteCartFailureState) {
                                AnimatedSnackBar.material(
                                  state.message,
                                  type: AnimatedSnackBarType.error,
                                  animationCurve: Curves.fastEaseInToSlowEaseOut,
                                  mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                                ).show(context);
                              }
                            },
                            child: GestureDetector(
                              onTap: () =>
                                  context
                                      .read<CartCubit>()
                                      .emitRemoveProductFromCartState(product.id),
                              child: Card(
                                surfaceTintColor: Colors.white,
                                color: Colors.white,
                                elevation: 0.8,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  child: Text(
                                    "Remove",
                                    style: TextStyleManager.font16DarkPurpleMedium
                                        .copyWith(color: ColorManager.lightBlack),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
