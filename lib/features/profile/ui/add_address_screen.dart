import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:art_space_user/core/widgets/app_text_button.dart';
import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:art_space_user/core/widgets/custom_non_border_text_form.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/text_style_manager.dart';

class AddAddressScreen extends StatelessWidget {
  static TextEditingController alias = TextEditingController();
  static TextEditingController country = TextEditingController();
  static TextEditingController state = TextEditingController();
  static TextEditingController city = TextEditingController();
  static TextEditingController street = TextEditingController();
  static TextEditingController postalCode = TextEditingController();
  static TextEditingController phone = TextEditingController();

  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Add Address",
          style: TextStyleManager.font24OLightBlackSemiBold,
        ),
      ),
      bottomSheet: Container(
        color: ColorManager.originalWhite,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: AppTextButton(
          buttonText: "Add Address",
          borderRadius: 14.0,
          buttonHeight: 55.0,
          textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomNonBorderTextForm(
                controller: alias,
                type: TextInputType.text,
                hint: "Enter alias",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: CountryStateCityPicker(
                  country: country,
                  state: state,
                  city: city,
                  dialogColor: ColorManager.originalWhite,
                  textFieldDecoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 18.0),
                    fillColor: ColorManager.lighterGray,
                    filled: true,
                    isDense: true,
                    hintStyle: TextStyleManager.font18OriginalBlackSemiBold,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide.none),
                    suffixIcon: const Icon(Icons.arrow_forward_ios_sharp, color: ColorManager.purple,)
                  ),
                ),
              ),
              CustomNonBorderTextForm(
                controller: state,
                type: TextInputType.text,
                hint: "Enter street",
              ),
              CustomNonBorderTextForm(
                controller: postalCode,
                type: TextInputType.number,
                hint: "Enter postal code",
              ),
              CustomNonBorderTextForm(
                controller: phone,
                type: TextInputType.phone,
                hint: "Enter phone",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
