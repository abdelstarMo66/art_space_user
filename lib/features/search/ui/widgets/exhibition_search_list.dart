import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/widgets/no_thing.dart';
import 'package:art_space_user/features/search/logic/search_cubit.dart';
import 'package:art_space_user/features/search/logic/search_state.dart';
import 'package:art_space_user/features/search/ui/widgets/search_exhibition_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/helpers/spacing.dart';

class ExhibitionSearchList extends StatelessWidget {
  const ExhibitionSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        if (state is SearchSuccessState) {
          return state.searchResponse.data.events.isNotEmpty
              ? ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 12.0,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => IntrinsicHeight(
                    child: SearchExhibitionItem(
                      exhibition: state.searchResponse.data.events[index],
                    ),
                  ),
                  separatorBuilder: (context, index) => verticalSpace(12.0),
                  itemCount: state.searchResponse.data.events.length,
                )
              : const NoThingWidget();
        } else if (state is SearchLoadingState) {
          return Center(
            child: LoadingAnimationWidget.fourRotatingDots(
              color: ColorManager.purple,
              size: 80.0,
            ),
          );
        } else {
          return const NoThingWidget();
        }
      },
    );
  }
}
