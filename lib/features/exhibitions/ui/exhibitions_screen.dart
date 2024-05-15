import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/widgets/app_custom_shimmer.dart';
import 'package:art_space_user/core/widgets/app_elevated_button.dart';
import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:art_space_user/core/widgets/no_thing.dart';
import 'package:art_space_user/features/exhibitions/logic/exhibition_cubit.dart';
import 'package:art_space_user/features/exhibitions/logic/exhibition_state.dart';
import 'package:art_space_user/features/exhibitions/ui/widgets/exhibition_filter_dialog.dart';
import 'package:art_space_user/features/exhibitions/ui/widgets/exhibition_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/utils/assets_manager.dart';

class ExhibitionsScreen extends StatelessWidget {
  const ExhibitionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExhibitionCubit, ExhibitionStates>(
      builder: (context, state) {
        ExhibitionCubit cubit = context.read<ExhibitionCubit>();
        return Scaffold(
          backgroundColor: ColorManager.scaffold,
          appBar: CustomAppBar(
            actions: [
              // AppElevatedButton(
              //   buttonWidth: 40.0,
              //   buttonHeight: 40.0,
              //   child: SvgPicture.asset(
              //     AssetsManager.icSort,
              //     width: 25.0,
              //     height: 25.0,
              //   ),
              //   onPressed: () {
              //     showModalBottomSheet(
              //       context: context,
              //       builder: (context) => ExhibitionSortDialog(
              //         cubit: cubit,
              //       ),
              //     );
              //   },
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: AppElevatedButton(
                  buttonWidth: 40.0,
                  buttonHeight: 40.0,
                  child: SvgPicture.asset(
                    AssetsManager.icFilter,
                    width: 25.0,
                    height: 25.0,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => ExhibitionFilterDialog(
                        cubit: cubit,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverList.separated(
                  itemCount: state is GetAllExhibitionsSuccess
                      ? state.getAllExhibitionsResponse.data.exhibitions.length
                      : 10,
                  itemBuilder: (context, index) => state
                          is GetAllExhibitionsSuccess
                      ? ExhibitionItem(
                          index: index,
                          exhibitionInfo: state.getAllExhibitionsResponse.data
                              .exhibitions[index],
                        )
                      : AppCustomShimmer(
                          child: Container(
                            height: 200.0,
                            margin: const EdgeInsets.symmetric(vertical: 4.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(
                                    index % 2 == 0 ? 52.0 : 0.0),
                                topStart: Radius.circular(
                                    index % 2 == 0 ? 0.0 : 52.0),
                                bottomEnd: const Radius.circular(52.0),
                                bottomStart: const Radius.circular(52.0),
                              ),
                            ),
                          ),
                        ),
                  separatorBuilder: (context, index) => verticalSpace(12.0),
                ),
                SliverFillRemaining(
                  child: state is GetAllExhibitionsSuccess &&
                          state.getAllExhibitionsResponse.data.exhibitions
                              .isEmpty
                      ? Container(
                          color: Colors.white,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              NoThingWidget(),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
