import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/widgets/app_text_button.dart';

enum ArtworkSortEnum { highPrice, lowPrice, ascTitle, descTitle }

class ArtworkSortDialog extends StatefulWidget {
  const ArtworkSortDialog({super.key});

  @override
  State<ArtworkSortDialog> createState() => _ArtworkSortDialogState();
}

class _ArtworkSortDialogState extends State<ArtworkSortDialog> {
  ArtworkSortEnum? exhibitionSortEnum;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManager.originalWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.0),
          topRight: Radius.circular(28.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Sort",
                  style: TextStyleManager.font18LightBlackBold,
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                onPressed: () {
                  exhibitionSortEnum = null;
                  context.pop();
                },
                child: Text(
                  "Reset",
                  style: TextStyleManager.font14DarkPurpleSemiBold,
                ),
              ),
            ],
          ),
          const Divider(height: 20.0, thickness: 0.8),
          sortItem(
            title: "Name",
            subTitle: "A - Z",
            value: ArtworkSortEnum.ascTitle,
          ),
          sortItem(
            title: "Name",
            subTitle: "Z - A",
            value: ArtworkSortEnum.descTitle,
          ),
          sortItem(
            title: "Price",
            subTitle: "Low to High",
            value: ArtworkSortEnum.lowPrice,
          ),
          sortItem(
            title: "Price",
            subTitle: "High to Low",
            value: ArtworkSortEnum.highPrice,
          ),
          verticalSpace(12.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                Expanded(
                  child: AppTextButton(
                    buttonText: "Cancel",
                    textStyle: TextStyleManager.font20DarkPurpleSemiBold,
                    onPressed: () => context.pop(),
                    backgroundColor: ColorManager.originalWhite,
                    borderRadius: 12.0,
                  ),
                ),
                horizontalSpace(18.0),
                Expanded(
                  child: AppTextButton(
                    buttonText: "Apply",
                    textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
                    onPressed: () {},
                    borderRadius: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget sortItem({
    required String title,
    required String subTitle,
    required ArtworkSortEnum value,
  }) =>
      ListTile(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: "$title   ",
                  style: TextStyleManager.font20LightBlackBold),
              TextSpan(
                text: subTitle,
                style: TextStyleManager.font16GrayRegular,
              ),
            ],
          ),
        ),
        contentPadding: EdgeInsets.zero,
        dense: true,
        leading: Radio<ArtworkSortEnum>(
          value: value,
          groupValue: exhibitionSortEnum,
          onChanged: (ArtworkSortEnum? value) {
            setState(() {
              exhibitionSortEnum = value;
            });
          },
        ),
      );
}