import 'package:art_space_user/core/networking/local/prefs_manager.dart';
import 'package:art_space_user/core/networking/local/shared_preferences.dart';
import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_all_artwork_response.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_artwork_response.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_category_response.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_style_response.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_subject_response.dart';
import 'package:art_space_user/features/artworks/data/repos/artwork_repo.dart';
import 'package:art_space_user/features/artworks/logic/artwork_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class ArtworkCubit extends Cubit<ArtworkStates> {
  final ArtworkRepo _artworkRepo;

  ArtworkCubit(this._artworkRepo) : super(ArtworkInitial());

  List<ArtworkInfo> allArtworks = [];
  bool loadAllArtwork = true;
  List<Category> categories = [];
  List<Style> styles = [];
  List<Subject> subjects = [];

  List<String> categorySelected = [];
  List<String> styleSelected = [];
  List<String> subjectSelected = [];

  num maxPrice = 0;
  num minPrice = 0;

  void emitGetAllArtworksState({
    String? sort,
    List<String>? category,
    List<String>? style,
    List<String>? subject,
    int? priceFrom,
    int? priceTo,
  }) async {
    emit(GetAllArtworksLoading());
    allArtworks = [];
    loadAllArtwork = true;
    final artworks = await _artworkRepo.getAllArtworks(
      token: SharedPreferencesManager.getData(
        key: PrefsManager.token,
      ),
      sort: sort,
      category: category,
      style: style,
      subject: subject,
      priceFrom: priceFrom,
      priceTo: priceTo,
    );

    artworks.when(
      success: (GetAllArtworksResponse response) {
        for (ArtworkInfo artwork in response.data.products) {
          allArtworks.add(artwork);
          if (artwork.price > maxPrice) {
            maxPrice = artwork.price;
          }
          if (artwork.price < minPrice) {
            minPrice = artwork.price;
          }
        }
        loadAllArtwork = false;
        emit(GetAllArtworksSuccess(response));
      },
      failure: (ErrorHandler error) {
        loadAllArtwork = false;
        emit(GetAllArtworksFailure(error.apiErrorModel.message));
      },
    );
  }

  void emitGetArtworkState({required String artworkId}) async {
    emit(GetArtworkLoading());

    final artwork = await _artworkRepo.getArtwork(
      artworkId: artworkId,
      token: SharedPreferencesManager.getData(
        key: PrefsManager.token,
      ),
    );

    artwork.when(
      success: (GetArtworkResponse response) {
        emit(GetArtworkSuccess(response));
      },
      failure: (ErrorHandler error) {
        emit(GetArtworkFailure(error.apiErrorModel.message));
      },
    );
  }

  void emitGetCategoryState() async {
    emit(GetCategoryLoading());

    final box = await Hive.openBox<Category>('categories');
    categories = box.values.toList();

    if (categories.isEmpty) {
      final category = await _artworkRepo.getCategories(
        token: SharedPreferencesManager.getData(
          key: PrefsManager.token,
        ),
      );

      category.when(
        success: (GetCategoryResponse response) async {
          await box.clear();
          await box.addAll(response.data);
          categories = box.values.toList();
          await box.close();

          emit(GetCategorySuccess(response.data));
        },
        failure: (ErrorHandler error) {
          emit(GetCategoryFailure(error.apiErrorModel.message));
        },
      );
    } else {
      await box.close();
      emit(GetCacheCategorySuccess(categories));
    }
  }

  void emitGetStyleState() async {
    emit(GetStyleLoading());

    final box = await Hive.openBox<Style>('styles');
    styles = box.values.toList();

    if (styles.isEmpty) {
      final style = await _artworkRepo.getStyles(
        token: SharedPreferencesManager.getData(
          key: PrefsManager.token,
        ),
      );

      style.when(
        success: (GetStyleResponse response) async {
          await box.clear();
          await box.addAll(response.data);
          styles = box.values.toList();
          await box.close();

          emit(GetStyleSuccess(response.data));
        },
        failure: (ErrorHandler error) {
          emit(GetStyleFailure(error.apiErrorModel.message));
        },
      );
    } else {
      await box.close();
      emit(GetCacheStyleSuccess(styles));
    }
  }

  void emitGetSubjectState() async {
    emit(GetSubjectLoading());

    final box = await Hive.openBox<Subject>('subjects');
    subjects = box.values.toList();

    if (subjects.isEmpty) {
      final subject = await _artworkRepo.getSubjects(
        token: SharedPreferencesManager.getData(
          key: PrefsManager.token,
        ),
      );

      subject.when(
        success: (GetSubjectResponse response) async {
          await box.clear();
          await box.addAll(response.data);
          subjects = box.values.toList();
          await box.close();

          emit(GetSubjectSuccess(response.data));
        },
        failure: (ErrorHandler error) {
          emit(GetSubjectFailure(error.apiErrorModel.message));
        },
      );
    } else {
      await box.close();
      emit(GetCacheSubjectSuccess(subjects));
    }
  }
}
