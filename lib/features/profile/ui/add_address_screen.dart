import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/widgets/app_custom_shimmer.dart';
import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:art_space_user/core/widgets/custom_non_border_text_form.dart';
import 'package:art_space_user/features/profile/logic/profile_cubit.dart';
import 'package:art_space_user/features/profile/logic/profile_state.dart';
import 'package:art_space_user/features/profile/ui/widgets/add_address_bloc_listener.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theming/text_style_manager.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Add Address",
          style: TextStyleManager.font24OLightBlackSemiBold,
        ),
        onTap: () {
          context.pop();
          context.read<ProfileCubit>().clearAddAddressControllers();
        },
      ),
      bottomSheet: Container(
        color: ColorManager.originalWhite,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: const AddAddressBlocListener(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<ProfileCubit, ProfileStates>(
            builder: (context, state) {
              if (context.read<ProfileCubit>().profile == null) {
                return AppCustomShimmer(
                  child: Column(
                    children: [
                      for (int i = 0; i < 3; i++) ...[
                        Container(
                          height: 60.0,
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ]
                    ],
                  ),
                );
              } else {
                return Form(
                  key: context.read<ProfileCubit>().addAddressFormKey,
                  child: Column(
                    children: [
                      CustomNonBorderTextForm(
                        controller:
                            context.read<ProfileCubit>().addressAliasController,
                        type: TextInputType.text,
                        hint: "Enter alias",
                        validator: (value) {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: CountryStateCityPicker(
                          country: context
                              .read<ProfileCubit>()
                              .addressCountryController,
                          state: context
                              .read<ProfileCubit>()
                              .addressStateController,
                          city: context
                              .read<ProfileCubit>()
                              .addressCityController,
                          dialogColor: ColorManager.originalWhite,
                          textFieldDecoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 18.0),
                              fillColor: ColorManager.lighterGray,
                              filled: true,
                              isDense: true,
                              hintStyle:
                                  TextStyleManager.font18OriginalBlackSemiBold,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide.none),
                              suffixIcon: const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: ColorManager.purple,
                              )),
                        ),
                      ),
                      CustomNonBorderTextForm(
                        controller:
                            context.read<ProfileCubit>().addressStreetController,
                        type: TextInputType.text,
                        hint: "Enter street",
                        validator: (value) {},
                      ),
                      CustomNonBorderTextForm(
                        controller: context
                            .read<ProfileCubit>()
                            .addressPostalCodeController,
                        type: TextInputType.number,
                        hint: "Enter postal code",
                        validator: (value) {},
                      ),
                      CustomNonBorderTextForm(
                        controller:
                            context.read<ProfileCubit>().addressPhoneController,
                        type: TextInputType.phone,
                        hint: "Enter phone",
                        validator: (value) {},
                      ),
                      verticalSpace(60.0),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
