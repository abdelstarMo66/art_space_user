import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';

class ExhibitionFilterDialog extends StatefulWidget {
  const ExhibitionFilterDialog({super.key});

  @override
  State<ExhibitionFilterDialog> createState() => _ExhibitionFilterDialogState();
}

class _ExhibitionFilterDialogState extends State<ExhibitionFilterDialog> {
  double _value = 1;
  double _startValue = 1;
  double _endValue = 999;

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
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
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
          verticalSpace(12.0),
          Text(
            "Duration",
            style: TextStyleManager.font18LightBlackSemiBold,
          ),
          Slider(
            min: 1,
            max: 14,
            value: _value,
            divisions: 14,
            label: '${_value.round()}',
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
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
              _startValue.round().toString(),
              _endValue.round().toString(),
            ),
            values: RangeValues(_startValue, _endValue),
            onChanged: (values) {
              setState(() {
                _startValue = values.start;
                _endValue = values.end;
              });
            },
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
