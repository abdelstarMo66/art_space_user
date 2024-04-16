import 'package:art_space_user/features/search/logic/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class SearchTextForm extends StatelessWidget {
  const SearchTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SearchCubit>().searchKey,
      child: TextFormField(
        controller: context.read<SearchCubit>().searchController,
        keyboardType: TextInputType.text,
        style: TextStyleManager.font16LighterBlackRegular,
        onChanged: (value) {
          // TODO: emit search state ofter wait 1 second before write again
        },
        textInputAction: TextInputAction.search,
        onEditingComplete: () {
          context.read<SearchCubit>().emitSearchState();
        },
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          hintText: "Enter Search Keyword",
          hintStyle: TextStyleManager.font16GrayRegular,
          fillColor: ColorManager.originalWhite,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18.0,
            vertical: 16.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: const BorderSide(
              color: ColorManager.purple,
              width: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
