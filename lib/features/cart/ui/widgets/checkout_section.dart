import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:art_space_user/core/widgets/app_elevated_button.dart';
import 'package:art_space_user/core/widgets/custom_dropdown_button.dart';
import 'package:art_space_user/features/cart/logic/cart_cubit.dart';
import 'package:art_space_user/features/profile/logic/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum PaymentMethod {
  cash,
  card,
}

class CheckoutSection extends StatefulWidget {
  final CartCubit cubit;

  const CheckoutSection({super.key, required this.cubit});

  @override
  State<CheckoutSection> createState() => _CheckoutSection();
}

class _CheckoutSection extends State<CheckoutSection> {
  PaymentMethod paymentMethod = PaymentMethod.cash;
  List<String> address = [];
  String selectedAddresses = "";

  @override
  void initState() {
    context.read<ProfileCubit>().emitGetAddressesState().then((value) {
      address = context
          .read<ProfileCubit>()
          .addresses
          .map((e) => "${e.street}, ${e.region}, ${e.city}, ${e.country}")
          .toList();

      setState(() {
        selectedAddresses = address[0];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.dartGray,
          width: 0.8
        ),
        color: ColorManager.lighterGray.withOpacity(0.3),
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomDropdownButton(
                  hint: "Select Your Address",
                  value: selectedAddresses,
                  dropdownItems: address,
                  buttonWidth: double.maxFinite,
                  dropdownWidth: double.maxFinite,
                  buttonDecoration: BoxDecoration(
                    color: ColorManager.lighterGray,
                    border: Border.all(color: ColorManager.dartGray),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  onChanged: (value) => setState(() {
                    if (value != null) {
                      selectedAddresses = value;
                    }
                  }),
                ),
              ),
              TextButton(
                onPressed: () => context.pushNamed(Routes.addAddress),
                child: Text(
                  "add address",
                  style: TextStyleManager.font14DarkPurpleSemiBold
                      .copyWith(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          ListTile(
            title: const Text('Cash'),
            onTap: () {
              setState(() {
                paymentMethod = PaymentMethod.cash;
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            trailing: SvgPicture.asset(
              AssetsManager.icCash,
              width: 28.0,
              height: 28.0,
            ),
            leading: Radio(
              value: PaymentMethod.cash,
              groupValue: paymentMethod,
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    paymentMethod = value;
                  }
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Card'),
            onTap: () {
              setState(() {
                paymentMethod = PaymentMethod.card;
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            trailing: SvgPicture.asset(
              AssetsManager.icVisa,
              width: 40.0,
              height: 40.0,
            ),
            leading: Radio(
              value: PaymentMethod.card,
              groupValue: paymentMethod,
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    paymentMethod = value;
                  }
                });
              },
            ),
          ),
          verticalSpace(12.0),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 72.0, vertical: 0.0),
            child: AppElevatedButton(
              buttonHeight: 45.0,
              onPressed: () {
                String addressId = context
                    .read<ProfileCubit>()
                    .addresses[
                address.indexOf(selectedAddresses)]
                    .id;

                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: ColorManager.lighterGray,
                    elevation: 1.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28.0, vertical: 22.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${paymentMethod == PaymentMethod.cash ? "Cash" : "Card"} Order",
                              style: TextStyleManager.font24OLightBlackSemiBold,
                            ),
                          ),
                          verticalSpace(12.0),
                          Row(
                            children: [
                              Expanded(
                                child: AppElevatedButton(
                                  onPressed: () {
                                    if (paymentMethod == PaymentMethod.cash) {
                                      context.pop();
                                      widget.cubit.emitCreateCashOrderState(
                                        cartId: widget.cubit.cartId ?? "",
                                        addressId: addressId,
                                      );
                                    } else if (paymentMethod ==
                                        PaymentMethod.card) {
                                      context.pop();
                                      widget.cubit.emitCreateCashOrderState(
                                        cartId: widget.cubit.cartId ?? "",
                                        addressId: addressId,
                                      );
                                    }
                                  },
                                  child: Text(
                                    "Confirm",
                                    style: TextStyleManager
                                        .font20OriginalWhiteSemiBold,
                                  ),
                                ),
                              ),
                              horizontalSpace(18.0),
                              Expanded(
                                child: AppElevatedButton(
                                  onPressed: () => context.pop(),
                                  backgroundColor: ColorManager.originalWhite,
                                  child: Text(
                                    "Cancel",
                                    style: TextStyleManager
                                        .font20OriginalWhiteSemiBold
                                        .copyWith(
                                            color: ColorManager.lightBlack),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Text(
                "Check Out",
                style: TextStyleManager.font20OriginalWhiteSemiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
