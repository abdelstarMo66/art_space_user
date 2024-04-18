import 'package:art_space_user/core/networking/local/prefs_manager.dart';
import 'package:art_space_user/core/networking/local/shared_preferences.dart';
import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/features/home/data/models/response/explore_exhibitions_response.dart';
import 'package:art_space_user/features/home/data/models/response/recently_artwork_response.dart';
import 'package:art_space_user/features/home/data/repos/home_repo.dart';
import 'package:art_space_user/features/home/logic/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(InitialHomeState());

  List<Exhibition> allExhibitions = [];
  List<ArtworkInfo> allArtworks = [];

  void emitExploreExhibitions() async {
    emit(ExploreExhibitionsLoading());
    allExhibitions = [];

    final exhibitions = await _homeRepo.exploreExhibition(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
      page: 1,
      limit: 5,
    );

    exhibitions.when(
      success: (ExploreExhibitionResponse response) {
        for (Exhibition exhibition in response.data.exhibitions) {
          allExhibitions.add(exhibition);
        }
        emit(ExploreExhibitionsSuccess(response));
      },
      failure: (ErrorHandler error) {
        emit(ExploreExhibitionsFailure(error.apiErrorModel.message));
      },
    );
  }

  void emitRecentlyArtworks() async {
    emit(RecentlyArtworksLoading());
    allArtworks = [];

    final artworks = await _homeRepo.recentlyArtworks(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
      page: 1,
      limit: 10,
    );

    artworks.when(
      success: (RecentlyArtworksResponse response) {
        for (ArtworkInfo artwork in response.data.products) {
          allArtworks.add(artwork);
        }
        emit(RecentlyArtworksSuccess(response));
      },
      failure: (ErrorHandler error) {
        emit(RecentlyArtworksFailure(error.apiErrorModel.message));
      },
    );
  }
}
