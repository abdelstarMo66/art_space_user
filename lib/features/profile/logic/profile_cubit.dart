import 'dart:io';

import 'package:art_space_user/core/networking/local/prefs_manager.dart';
import 'package:art_space_user/core/networking/local/shared_preferences.dart';
import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/features/profile/data/models/request/add_address_request_body.dart';
import 'package:art_space_user/features/profile/data/models/request/change_password_request_body.dart';
import 'package:art_space_user/features/profile/data/models/request/update_profile_request_body.dart';
import 'package:art_space_user/features/profile/data/models/response/add_address_response.dart';
import 'package:art_space_user/features/profile/data/models/response/change_password_response.dart';
import 'package:art_space_user/features/profile/data/models/response/delete_address_response.dart';
import 'package:art_space_user/features/profile/data/models/response/get_addresses_response.dart';
import 'package:art_space_user/features/profile/data/models/response/get_profile_response.dart';
import 'package:art_space_user/features/profile/data/models/response/update_profile_image_response.dart';
import 'package:art_space_user/features/profile/data/models/response/update_profile_response.dart';
import 'package:art_space_user/features/profile/data/models/response/your_order_response.dart';
import 'package:art_space_user/features/profile/data/models/response/your_orders_response.dart';
import 'package:art_space_user/features/profile/data/repos/profile_repo.dart';
import 'package:art_space_user/features/profile/logic/profile_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  final ProfileRepo _profileRepo;

  ProfileCubit(this._profileRepo) : super(ProfileInitial());

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  final TextEditingController addressAliasController = TextEditingController();
  final TextEditingController addressCountryController =
      TextEditingController();
  final TextEditingController addressStateController = TextEditingController();
  final TextEditingController addressCityController = TextEditingController();
  final TextEditingController addressStreetController = TextEditingController();
  final TextEditingController addressPostalCodeController =
      TextEditingController();
  final TextEditingController addressPhoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addAddressFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  GetProfileResponse? profile;
  List<AddressData> addresses = [];
  List<Orders> orders = [];

  void clearAddAddressControllers() {
    addressAliasController.clear();
    addressCountryController.clear();
    addressStateController.clear();
    addressCityController.clear();
    addressStreetController.clear();
    addressPostalCodeController.clear();
    addressPhoneController.clear();
  }

  void clearChangePasswordControllers() {
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmNewPasswordController.clear();
  }

  void setProfileControllers() {
    nameController.text = profile!.data.name;
    emailController.text = profile!.data.email;
    phoneController.text = profile!.data.phone;
  }

  void emitGetProfileState() async {
    emit(GetProfileLoadingState());

    final response = await _profileRepo.getProfile(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
    );

    response.when(
      success: (GetProfileResponse response) {
        profile = response;
        emit(GetProfileSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(GetProfileFailureState(error.apiErrorModel.message));
      },
    );
  }

  void emitChangePasswordState() async {
    emit(ChangePasswordLoadingState());

    final response = await _profileRepo.changePassword(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
      changePasswordRequestBody: ChangePasswordRequestBody(
        currentPassword: currentPasswordController.text,
        password: newPasswordController.text,
        confirmPassword: confirmNewPasswordController.text,
      ),
    );

    response.when(
      success: (ChangePasswordResponse response) {
        emit(ChangePasswordSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(ChangePasswordFailureState(error.apiErrorModel.message));
      },
    );
  }

  void emitUpdateProfileState() async {
    emit(UpdateProfileLoadingState());

    final response = await _profileRepo.updateProfile(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
      updateProfileRequestBody: UpdateProfileRequestBody(
        name: nameController.text,
        phone: phoneController.text,
      ),
    );

    response.when(
      success: (UpdateProfileResponse response) {
        emit(UpdateProfileSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(UpdateProfileFailureState(error.apiErrorModel.message));
      },
    );
  }

  void emitAddAddressState() async {
    emit(AddAddressLoadingState());

    final response = await _profileRepo.addAddress(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
      addAddressRequestBody: AddAddressRequestBody(
        alias: addressAliasController.text,
        country: addressCountryController.text,
        region: addressStateController.text,
        city: addressCityController.text,
        street: addressStreetController.text,
        postalCode: addressPostalCodeController.text,
        phone: addressPhoneController.text,
      ),
    );

    response.when(
      success: (AddAddressResponse response) {
        emitGetAddressesState();
        emit(AddAddressSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(AddAddressFailureState(error.apiErrorModel.message));
      },
    );
  }

  void emitDeleteAddressState({required String addressId}) async {
    emit(DeleteAddressLoadingState());

    final response = await _profileRepo.deleteAddress(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
      addressId: addressId,
    );

    response.when(
      success: (DeleteAddressResponse response) {
        emitGetAddressesState();
        emit(DeleteAddressSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(DeleteAddressFailureState(error.apiErrorModel.message));
      },
    );
  }

  Future<void> emitGetAddressesState() async {
    addresses = [];
    emit(GetAddressLoadingState());

    final response = await _profileRepo.getAddresses(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
    );

    response.when(
      success: (GetAddressResponse response) {
        addresses = response.data;
        emit(GetAddressSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(GetAddressFailureState(error.apiErrorModel.message));
      },
    );
  }

  void emitUpdateProfileImageState() async {
    emit(UpdateProfileImageLoadingState());

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    File? file = File(image!.path);

    // FormData data = FormData.fromMap({});
    //
    // data.files.add(MapEntry(
    //     "profileImg",
    //     await MultipartFile.fromFile(
    //       file.path,
    //       filename: file.path.split('/').last,
    //       contentType: MediaType("image", "jpeg"),
    //     )));
    //
    // print(data.fields);

    final response = await _profileRepo.updateProfileImage(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
      profileImage: file,
    );

    response.when(
      success: (UpdateProfileImageResponse response) {
        emit(UpdateProfileImageSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(UpdateProfileImageFailureState(error.apiErrorModel.message));
      },
    );
  }

  void emitOrdersState() async {
    orders = [];
    emit(YourOrdersLoadingState());

    final response = await _profileRepo.orders(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
    );

    response.when(
      success: (YourOrdersResponse response) {
        orders = response.data;
        emit(YourOrdersSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(YourOrdersFailureState(error.apiErrorModel.message));
      },
    );
  }

  void emitOrderState(String orderId) async {
    emit(YourOrderLoadingState());

    final response = await _profileRepo.orderDetails(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
      orderId: orderId
    );

    response.when(
      success: (YourOrderResponse response) {
        emit(YourOrderSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(YourOrderFailureState(error.apiErrorModel.message));
      },
    );
  }
}
