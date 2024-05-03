import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:art_space_user/core/widgets/app_elevated_button.dart';
import 'package:art_space_user/features/cart/logic/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderDialog extends StatefulWidget {
  final CartCubit cubit;

  const OrderDialog({super.key, required this.cubit});

  @override
  State<OrderDialog> createState() => _OrderDialogState();
}

class _OrderDialogState extends State<OrderDialog> {
  bool cashOrder = true;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: ColorManager.moreLightGray,
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 12.0, left: 18.0, right: 18.0, bottom: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Create Order", style: TextStyleManager.font22LightBlackBold,),
            verticalSpace(22.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      cashOrder = true;
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorManager.originalWhite,
                        borderRadius: BorderRadius.circular(14.0),
                        border: Border.all(
                          color: cashOrder
                              ? ColorManager.purple
                              : ColorManager.transparent,
                          width: cashOrder ? 2.0 : 0.0,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18.0,
                        vertical: 12.0,
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            AssetsManager.icCash,
                            width: 60.0,
                            height: 60.0,
                          ),
                          Text(
                            "Cash",
                            style: TextStyleManager.font20DarkPurpleSemiBold
                                .copyWith(
                              color: cashOrder
                                  ? ColorManager.purple
                                  : ColorManager.originalBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                horizontalSpace(10.0),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      cashOrder = false;
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorManager.originalWhite,
                        borderRadius: BorderRadius.circular(14.0),
                        border: Border.all(
                          color: !cashOrder
                              ? ColorManager.purple
                              : ColorManager.transparent,
                          width: !cashOrder ? 2.0 : 0.0,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18.0,
                        vertical: 12.0,
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            AssetsManager.icVisa,
                            width: 60.0,
                            height: 60.0,
                          ),
                          Text(
                            "Visa",
                            style: TextStyleManager.font20DarkPurpleSemiBold
                                .copyWith(
                              color: !cashOrder
                                  ? ColorManager.purple
                                  : ColorManager.originalBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(18.0),
            Row(
              children: [
                Expanded(
                  child: AppElevatedButton(
                    onPressed: () {},
                    backgroundColor: ColorManager.purple,
                    child: Text(
                      "Confirm",
                      style: TextStyleManager.font20OriginalWhiteSemiBold,
                    ),
                  ),
                ),
                horizontalSpace(8.0),
                Expanded(
                  child: AppElevatedButton(
                    onPressed: () => context.pop(),
                    backgroundColor: ColorManager.dartGray,
                    child: Text(
                      "Cancel",
                      style: TextStyleManager.font20OriginalWhiteSemiBold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
