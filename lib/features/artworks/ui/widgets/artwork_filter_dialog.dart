import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/features/artworks/logic/artwork_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final ArtworkCubit cubit;

  const ArtworkFilterDialog({super.key, required this.cubit});

  @override
  State<ArtworkFilterDialog> createState() => _ArtworkFilterDialogState();
}

class _ArtworkFilterDialogState extends State<ArtworkFilterDialog> {
  late double startValue;
  late double endValue;

  @override
  void initState() {
    startValue = widget.cubit.minPrice.toDouble();
    endValue = widget.cubit.maxPrice.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0.h,
      decoration: BoxDecoration(
        color: ColorManager.originalWhite,
        borderRadius: BorderRadius.circular(28.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      margin: const EdgeInsets.symmetric(horizontal: 22.0),
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
                onPressed: () {
                  widget.cubit.categorySelected = [];
                  widget.cubit.styleSelected = [];
                  widget.cubit.subjectSelected = [];
                  widget.cubit.emitGetAllArtworksState();
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
                      items: context
                          .read<ArtworkCubit>()
                          .categories
                          .map((category) => MultiSelectCard(
                              value: category.id, label: category.title))
                          .toList(),
                      onChange: (allSelectedItems, selectedItem) {
                        setState(() {
                          context.read<ArtworkCubit>().categorySelected =
                              allSelectedItems;
                        });
                      },
                    ),
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
                      items: context
                          .read<ArtworkCubit>()
                          .styles
                          .map((category) => MultiSelectCard(
                              value: category.id, label: category.title))
                          .toList(),
                      onChange: (allSelectedItems, selectedItem) {
                        setState(() {
                          context.read<ArtworkCubit>().styleSelected =
                              allSelectedItems;
                        });
                      },
                    ),
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
                      items: context
                          .read<ArtworkCubit>()
                          .subjects
                          .map((category) => MultiSelectCard(
                              value: category.id, label: category.title))
                          .toList(),
                      onChange: (allSelectedItems, selectedItem) {
                        setState(() {
                          context.read<ArtworkCubit>().subjectSelected =
                              allSelectedItems;
                        });
                      },
                    ),
                  ),
                  verticalSpace(12.0),
                  Text(
                    "Price",
                    style: TextStyleManager.font18LightBlackSemiBold,
                  ),
                  RangeSlider(
                    min: widget.cubit.minPrice.toDouble(),
                    max: widget.cubit.maxPrice.toDouble(),
                    labels: RangeLabels(
                      startValue.round().toString(),
                      endValue.round().toString(),
                    ),
                    divisions: widget.cubit.maxPrice.round() -
                        widget.cubit.minPrice.round(),
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
                    onPressed: () {
                      widget.cubit.emitGetAllArtworksState(
                        category: widget.cubit.categorySelected,
                        style: widget.cubit.styleSelected,
                        subject: widget.cubit.subjectSelected,
                        priceFrom: endValue.round(),
                        priceTo: startValue.round(),
                      );
                      context.pop();
                    },
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

  @override
  void dispose() {
    widget.cubit.categorySelected = [];
    widget.cubit.styleSelected = [];
    widget.cubit.subjectSelected = [];
    super.dispose();
  }
}
