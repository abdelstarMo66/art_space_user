import 'package:art_space_user/features/profile/data/models/response/add_address_response.dart';
import 'package:art_space_user/features/profile/data/models/response/change_password_response.dart';
import 'package:art_space_user/features/profile/data/models/response/delete_address_response.dart';
import 'package:art_space_user/features/profile/data/models/response/get_profile_response.dart';
import 'package:art_space_user/features/profile/data/models/response/update_profile_image_response.dart';
import 'package:art_space_user/features/profile/data/models/response/update_profile_response.dart';

abstract class ProfileStates {}

final class ProfileInitial extends ProfileStates {}

final class ReloadState extends ProfileStates {}

// GetProfile
final class GetProfileLoadingState extends ProfileStates {}

final class GetProfileSuccessState extends ProfileStates {
  final GetProfileResponse profileResponse;

  GetProfileSuccessState(this.profileResponse);
}

final class GetProfileFailureState extends ProfileStates {
  final String message;

  GetProfileFailureState(this.message);
}

// ChangePassword
final class ChangePasswordLoadingState extends ProfileStates {}

final class ChangePasswordSuccessState extends ProfileStates {
  final ChangePasswordResponse changePasswordResponse;

  ChangePasswordSuccessState(this.changePasswordResponse);
}

final class ChangePasswordFailureState extends ProfileStates {
  final String message;

  ChangePasswordFailureState(this.message);
}

// UpdateProfile
final class UpdateProfileLoadingState extends ProfileStates {}

final class UpdateProfileSuccessState extends ProfileStates {
  final UpdateProfileResponse updateProfileResponse;

  UpdateProfileSuccessState(this.updateProfileResponse);
}

final class UpdateProfileFailureState extends ProfileStates {
  final String message;

  UpdateProfileFailureState(this.message);
}

// AddAddress
final class AddAddressLoadingState extends ProfileStates {}

final class AddAddressSuccessState extends ProfileStates {
  final AddAddressResponse addAddressResponse;

  AddAddressSuccessState(this.addAddressResponse);
}

final class AddAddressFailureState extends ProfileStates {
  final String message;

  AddAddressFailureState(this.message);
}

// DeleteAddress
final class DeleteAddressLoadingState extends ProfileStates {}

final class DeleteAddressSuccessState extends ProfileStates {
  final DeleteAddressResponse deleteAddressResponse;

  DeleteAddressSuccessState(this.deleteAddressResponse);
}

final class DeleteAddressFailureState extends ProfileStates {
  final String message;

  DeleteAddressFailureState(this.message);
}

// UpdateProfileImage
final class UpdateProfileImageLoadingState extends ProfileStates {}

final class UpdateProfileImageSuccessState extends ProfileStates {
  final UpdateProfileImageResponse updateProfileImageResponse;

  UpdateProfileImageSuccessState(this.updateProfileImageResponse);
}

final class UpdateProfileImageFailureState extends ProfileStates {
  final String message;

  UpdateProfileImageFailureState(this.message);
}
