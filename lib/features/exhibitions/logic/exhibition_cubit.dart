import 'package:art_space_user/core/networking/local/prefs_manager.dart';
import 'package:art_space_user/core/networking/local/shared_preferences.dart';
import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/features/exhibitions/data/models/response/book_exhibition_response.dart';
import 'package:art_space_user/features/exhibitions/data/models/response/get_exhibition_response.dart';
import 'package:art_space_user/features/exhibitions/data/repos/exhibition_repo.dart';
import 'package:art_space_user/features/exhibitions/logic/exhibition_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/response/get_all_exhibitions_response.dart';

class ExhibitionCubit extends Cubit<ExhibitionStates> {
  final ExhibitionRepo _exhibitionRepo;

  ExhibitionCubit(this._exhibitionRepo) : super(ExhibitionInitial());

  List<Exhibition> allExhibitions = [];
  num maxDuration = 14;
  num minDuration = 1;
  SingleExhibition? singleExhibition;

  void emitGetAllExhibitions({
    String? sort,
    int? durationFrom,
    int? durationTo,
  }) async {
    emit(GetAllExhibitionsLoading());
    allExhibitions = [];

    final exhibitions = await _exhibitionRepo.getAllExhibition(
      token: SharedPreferencesManager.getData(
        key: PrefsManager.token,
      ),
      sort: sort,
      durationFrom: durationFrom,
      durationTo: durationTo,
    );

    exhibitions.when(
      success: (GetAllExhibitionResponse response) {
        allExhibitions = response.data.exhibitions;
        emit(GetAllExhibitionsSuccess(response));
      },
      failure: (ErrorHandler error) {
        emit(GetAllExhibitionsFailure(error.apiErrorModel.message));
      },
    );
  }

  void emitGetExhibition({required String exhibitionId}) async {
    emit(GetExhibitionLoading());

    final exhibition = await _exhibitionRepo.getExhibition(
      token: SharedPreferencesManager.getData(
        key: PrefsManager.token,
      ),
      exhibitionId: exhibitionId,
    );

    exhibition.when(
      success: (GetExhibitionResponse response) {
        singleExhibition = response.data;
        emit(GetExhibitionSuccess(response));
      },
      failure: (ErrorHandler error) {
        emit(GetExhibitionFailure(error.apiErrorModel.message));
      },
    );
  }

  void emitBookExhibitionState({required String exhibitionId}) async {
    emit(BookExhibitionLoading());

    final exhibition = await _exhibitionRepo.bookExhibition(
      token: SharedPreferencesManager.getData(
        key: PrefsManager.token,
      ),
      exhibitionId: exhibitionId,
    );

    exhibition.when(
      success: (BookExhibitionResponse response) {
        emit(BookExhibitionSuccess(response));
      },
      failure: (ErrorHandler error) {
        emit(BookExhibitionFailure(error.apiErrorModel.message));
      },
    );
  }
}
