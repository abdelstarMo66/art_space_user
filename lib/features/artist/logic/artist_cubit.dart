import 'package:art_space_user/core/networking/local/prefs_manager.dart';
import 'package:art_space_user/core/networking/local/shared_preferences.dart';
import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/features/artist/data/models/response/artist_response.dart';
import 'package:art_space_user/features/artist/data/repos/artist_repo.dart';
import 'package:art_space_user/features/artist/logic/artist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtistCubit extends Cubit<ArtistStates> {
  final ArtistRepo _artistRepo;

  ArtistCubit(this._artistRepo) : super(InitialArtistStata());

  int tIndex = 0;

  void changeTab(int index) {
    tIndex = index;
    emit(ChangeTapBarState());
  }

  late ArtistResponse artistResponse;

  void emitArtistState(String artistId) async {
    emit(ArtistLoadingState());

    final artist = await _artistRepo.getArtist(
      token: SharedPreferencesManager.getData(
        key: PrefsManager.token,
      ),
      artistId: artistId,
    );

    artist.when(
      success: (ArtistResponse response) {
        artistResponse = response;
        emit(ArtistSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(ArtistFailureState(error.apiErrorModel.message));
      },
    );
  }
}
