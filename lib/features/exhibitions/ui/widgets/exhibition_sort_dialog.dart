import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/widgets/app_text_button.dart';

enum ExhibitionSortEnum { highPrice, lowPrice, ascTitle, descTitle }

class ExhibitionSortDialog extends StatefulWidget {
  const ExhibitionSortDialog({super.key});

  @override
  State<ExhibitionSortDialog> createState() => _ExhibitionSortDialogState();
}

class _ExhibitionSortDialogState extends State<ExhibitionSortDialog> {
  ExhibitionSortEnum? exhibitionSortEnum;

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
            value: ExhibitionSortEnum.ascTitle,
          ),
          sortItem(
            title: "Name",
            subTitle: "Z - A",
            value: ExhibitionSortEnum.descTitle,
          ),
          sortItem(
            title: "Price",
            subTitle: "Low to High",
            value: ExhibitionSortEnum.lowPrice,
          ),
          sortItem(
            title: "Price",
            subTitle: "High to Low",
            value: ExhibitionSortEnum.highPrice,
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
    required ExhibitionSortEnum value,
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
        leading: Radio<ExhibitionSortEnum>(
          value: value,
          groupValue: exhibitionSortEnum,
          onChanged: (ExhibitionSortEnum? value) {
            setState(() {
              exhibitionSortEnum = value;
            });
          },
        ),
      );
}
