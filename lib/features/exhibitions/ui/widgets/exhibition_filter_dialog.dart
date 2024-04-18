import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/widgets/app_text_button.dart';
import 'package:art_space_user/features/exhibitions/logic/exhibition_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';

class ExhibitionFilterDialog extends StatefulWidget {
  final ExhibitionCubit cubit;

  const ExhibitionFilterDialog({super.key, required this.cubit});

  @override
  State<ExhibitionFilterDialog> createState() => _ExhibitionFilterDialogState();
}

class _ExhibitionFilterDialogState extends State<ExhibitionFilterDialog> {
  late double _startDurationValue;
  late double _endDurationValue;

  @override
  void initState() {
    _startDurationValue = widget.cubit.minDuration.toDouble();
    _endDurationValue = widget.cubit.maxDuration.toDouble();
    super.initState();
  }

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
                onPressed: () {
                  widget.cubit.emitGetAllExhibitions();
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
          verticalSpace(12.0),
          Text(
            "Duration",
            style: TextStyleManager.font18LightBlackSemiBold,
          ),
          RangeSlider(
            min: widget.cubit.minDuration.toDouble(),
            max: widget.cubit.maxDuration.toDouble(),
            labels: RangeLabels(
              _startDurationValue.round().toString(),
              _endDurationValue.round().toString(),
            ),
            divisions: 14,
            values: RangeValues(_startDurationValue, _endDurationValue),
            onChanged: (values) {
              setState(() {
                _startDurationValue = values.start;
                _endDurationValue = values.end;
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
                    onPressed: () {
                      widget.cubit.emitGetAllExhibitions(
                        durationFrom: _endDurationValue.round(),
                        durationTo: _startDurationValue.round(),
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
}
