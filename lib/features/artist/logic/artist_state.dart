import 'package:art_space_user/features/artist/data/models/response/artist_response.dart';

abstract class ArtistStates {}

class InitialArtistStata extends ArtistStates {}

class ChangeTapBarState extends ArtistStates {}

class ArtistLoadingState extends ArtistStates {}

class ArtistSuccessState extends ArtistStates {
  final ArtistResponse artistResponse;

  ArtistSuccessState(this.artistResponse);
}

class ArtistFailureState extends ArtistStates {
  final String message;

  ArtistFailureState(this.message);
}
