import 'package:art_space_user/features/gallery/data/models/response/bid_auction_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/get_all_auctions_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/get_auction_response.dart';

abstract class GalleryStates {}

class InitialGalleryState extends GalleryStates {}

class GetAllAuctionsLoadingState extends GalleryStates {}

class GetAllAuctionsSuccessState extends GalleryStates {
  final GetAllAuctionsResponse gerAllAuctionResponse;

  GetAllAuctionsSuccessState(this.gerAllAuctionResponse);
}

class GetAllAuctionsFailureState extends GalleryStates {
  final String message;

  GetAllAuctionsFailureState(this.message);
}

class GetAuctionLoadingState extends GalleryStates {}

class GetAuctionSuccessState extends GalleryStates {
  final GetAuctionResponse getAuctionResponse;

  GetAuctionSuccessState(this.getAuctionResponse);
}

class GetAuctionFailureState extends GalleryStates {
  final String message;

  GetAuctionFailureState(this.message);
}

class BidAuctionLoadingState extends GalleryStates {}

class BidAuctionSuccessState extends GalleryStates {
  final BidAuctionResponse bidAuctionResponse;

  BidAuctionSuccessState(this.bidAuctionResponse);
}

class BidAuctionFailureState extends GalleryStates {
  final String message;

  BidAuctionFailureState(this.message);
}

class BidRefreshState extends GalleryStates {}
