class VariableManager {
  static const String fontFamily = "Cairo";
}

class ApiConstants {
  static const String apiBaseUrl = "https://art-space-v9.onrender.com/api/v1/";
  static const String socketServerURL = "https://art-space-v9.onrender.com";

  // Auth
  static const String login = "userAuth/login";
  static const String forgetPassword = "userAuth/forgotPassword";
  static const String verifyCode = "userAuth/verifyCode";
  static const String resetPassword = "userAuth/resetPassword";
  static const String register = "userAuth/signup";
  static const String verifyEmail = "userAuth/verifyEmail";
  static const String resendCode = "userAuth/resendCode";

  // Profile
  static const String getProfile = "users/getProfile";
  static const String changePassword = "users/changePassword";
  static const String updateProfile = "users/updateProfile";
  static const String updateImage = "users/updateImage";
  static const String address = "users/address";
  static const String removeAddress = "users/address/{addressId}";

  // Search
  static const String search = "search/user";

  // Artwork
  static const String getAllArtwork = "products";
  static const String getArtwork = "products/{artworkId}";
  static const String getCategory = "categories";
  static const String getStyle = "styles";
  static const String getSubject = "subjects";

  // Artist
  static const String getArtist = "artists/info/{artistId}";

  // Exhibition
  static const String getAllExhibition = "events";
  static const String getExhibition = "events/{exhibitionId}";
  static const String bookExhibition = "bookEvent/{exhibitionId}";

  // Home
  static const String exploreExhibition = "events";
  static const String recentlyArtwork = "products";

  // Cart
  static const String cart = "cart";
  static const String deleteCart = "cart/{productId}";

  // Gallery
  static const String getAllAuctions = "auction";
  static const String getAuction = "auction/product/{auctionId}";
  static const String registerAuction = "/registerAuction/checkoutSession/{auctionId}";
  static const String bid = "auction/{auctionId}/updatePrice";
  static const String getBookedExhibitions = "bookEvent";
  static const String getRegisteredAuction = "registerAuction/registerAuctions";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
