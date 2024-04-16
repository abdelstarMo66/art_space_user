import 'package:art_space_user/core/networking/local/prefs_manager.dart';
import 'package:art_space_user/core/networking/local/shared_preferences.dart';
import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/features/search/data/models/response/search_response.dart';
import 'package:art_space_user/features/search/data/repos/search_repo.dart';
import 'package:art_space_user/features/search/logic/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  final SearchRepo _searchRepo;

  SearchCubit(this._searchRepo) : super(SearchInitial());

  TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> searchKey = GlobalKey<FormState>();

  void emitSearchState({String? keyword}) async {
    emit(SearchLoadingState());

    final response = await _searchRepo.search(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
      keyword: keyword ?? searchController.text,
    );

    response.when(
      success: (SearchResponse response) {
        emit(SearchSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(SearchFailureState(error.apiErrorModel.message));
      },
    );
  }
}
