import 'package:art_space_user/core/di/dependency_injection.dart';
import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/widgets/app_custom_shimmer.dart';
import 'package:art_space_user/core/widgets/app_elevated_button.dart';
import 'package:art_space_user/core/widgets/no_thing.dart';
import 'package:art_space_user/features/cart/logic/cart_cubit.dart';
import 'package:art_space_user/features/cart/logic/cart_states.dart';
import 'package:art_space_user/features/cart/ui/widgets/cart_item.dart';
import 'package:art_space_user/features/cart/ui/widgets/order_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (context) => getIt<CartCubit>()..emitGetCartState(),
      child: BlocBuilder<CartCubit, CartStates>(
        builder: (context, state) {
          CartCubit cubit = context.read<CartCubit>();
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.only(end: 8.0, bottom: 4.0),
                    child: Row(
                      children: [
                        Text(
                          "Cart Items",
                          style: TextStyleManager.font24LightBlackBold,
                        ),
                        const Spacer(),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 900),
                          opacity: cubit.cartItems.isNotEmpty ? 1.0 : 0.0,
                          child: Text(
                            "${cubit.cartItems.length} Item",
                            style: TextStyleManager.font18PurpleRegular,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList.builder(
                  itemCount: state is GetCartLoadingState
                      ? 6
                      : cubit.cartItems.isNotEmpty
                          ? cubit.cartItems.length
                          : 1,
                  itemBuilder: (context, index) => state is GetCartLoadingState
                      ? AppCustomShimmer(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            height: 140.0,
                          ),
                        )
                      : cubit.cartItems.isNotEmpty
                          ? CartItem(
                              product: cubit.cartItems[index].product,
                            )
                          : const NoThingWidget(),
                ),
                SliverToBoxAdapter(
                  child: cubit.cartItems.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 52.0, vertical: 12.0),
                          child: AppElevatedButton(
                            buttonHeight: 45.0,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => OrderDialog(
                                  cubit: cubit,
                                ),
                              );
                            },
                            child: Text(
                              "Confirm Order",
                              style:
                                  TextStyleManager.font20OriginalWhiteSemiBold,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                SliverToBoxAdapter(
                  child: verticalSpace(70.0),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
