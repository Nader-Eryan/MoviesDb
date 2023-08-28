import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whats_for_tonight/features/home/data/models/show/show.dart';
import 'package:whats_for_tonight/features/home/data/repos/home_repo.dart';

part 'genre_shows_state.dart';

class GenreShowsCubit extends Cubit<GenreShowsState> {
  GenreShowsCubit(
    this.homeRepo,
  ) : super(GenreShowsInitial());
  final HomeRepo homeRepo;
  Map<String, List<Show>> fetchedGenres = {};
  Future<void> fetchGenreShows({required String genre}) async {
    if (fetchedGenres.containsKey(genre) && fetchedGenres[genre] != null) {
      emit(GenreShowsSuccess(fetchedGenres[genre]!));
      return;
    }
    emit(GenreShowsLoading());
    var result = await homeRepo.fetchGenreShows(genre);
    result.fold((failure) => emit(GenreShowsFailure(failure.errMessage)),
        (showList) {
      emit(GenreShowsSuccess(showList));
      fetchedGenres[genre] = showList;
    });
  }
}
