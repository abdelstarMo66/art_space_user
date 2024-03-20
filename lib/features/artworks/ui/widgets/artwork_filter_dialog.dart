import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/app_text_button.dart';

class CategoryModel {
  final String id;
  final String title;

  const CategoryModel({required this.id, required this.title});
}

class ArtworkFilterDialog extends StatefulWidget {
  const ArtworkFilterDialog({super.key});

  @override
  State<ArtworkFilterDialog> createState() => _ArtworkFilterDialogState();
}

class _ArtworkFilterDialogState extends State<ArtworkFilterDialog> {
  double startValue = 1;
  double endValue = 999;

  static List<CategoryModel> categories = const [
    CategoryModel(id: "1", title: "One"),
    CategoryModel(id: "2", title: "Two"),
    CategoryModel(id: "3", title: "Three"),
    CategoryModel(id: "4", title: "Four"),
    CategoryModel(id: "5", title: "Five"),
    CategoryModel(id: "6", title: "Six"),
    CategoryModel(id: "7", title: "Seven"),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0.h,
      decoration: BoxDecoration(
        color: ColorManager.originalWhite,
        borderRadius: BorderRadius.circular(28.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      margin: const EdgeInsets.symmetric(horizontal:22.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Filter",
                  style: TextStyleManager.font18LightBlackBold,
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Reset",
                  style: TextStyleManager.font14DarkPurpleSemiBold,
                ),
              ),
            ],
          ),
          const Divider(height: 20.0, thickness: 0.8),
          verticalSpace(6.0),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: TextStyleManager.font18LightBlackSemiBold,
                  ),
                  verticalSpace(12.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: MultiSelectContainer(
                        prefix: MultiSelectPrefix(
                          selectedPrefix: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: SvgPicture.asset(
                              AssetsManager.icCheck,
                              height: 20.0,
                            ),
                          ),
                        ),
                        items: categories
                            .map((category) => MultiSelectCard(
                                value: category.id, label: category.title))
                            .toList(),
                        onChange: (allSelectedItems, selectedItem) {}),
                  ),
                  verticalSpace(18.0),
                  Text(
                    "Styles",
                    style: TextStyleManager.font18LightBlackSemiBold,
                  ),
                  verticalSpace(12.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: MultiSelectContainer(
                        prefix: MultiSelectPrefix(
                          selectedPrefix: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: SvgPicture.asset(
                              AssetsManager.icCheck,
                              height: 20.0,
                            ),
                          ),
                        ),
                        items: categories
                            .map((category) => MultiSelectCard(
                                value: category.id, label: category.title))
                            .toList(),
                        onChange: (allSelectedItems, selectedItem) {}),
                  ),
                  verticalSpace(18.0),
                  Text(
                    "Subjects",
                    style: TextStyleManager.font18LightBlackSemiBold,
                  ),
                  verticalSpace(12.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: MultiSelectContainer(
                        prefix: MultiSelectPrefix(
                          selectedPrefix: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: SvgPicture.asset(
                              AssetsManager.icCheck,
                              height: 20.0,
                            ),
                          ),
                        ),
                        items: categories
                            .map((category) => MultiSelectCard(
                                value: category.id, label: category.title))
                            .toList(),
                        onChange: (allSelectedItems, selectedItem) {}),
                  ),
                  verticalSpace(12.0),
                  Text(
                    "Price",
                    style: TextStyleManager.font18LightBlackSemiBold,
                  ),
                  RangeSlider(
                    min: 0,
                    max: 999,
                    labels: RangeLabels(
                      startValue.round().toString(),
                      endValue.round().toString(),
                    ),
                    values: RangeValues(startValue, endValue),
                    onChanged: (values) {
                      setState(() {
                        startValue = values.start;
                        endValue = values.end;
                      });
                    },
                  ),
                ],
              ),
            ),
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
}
