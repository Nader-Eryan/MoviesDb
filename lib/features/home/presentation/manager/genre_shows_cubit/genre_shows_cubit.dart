// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whats_for_tonight/features/home/data/models/show/show.dart';
import 'package:whats_for_tonight/features/home/data/repos/home_repo.dart';

part 'genre_shows_state.dart';

class GenreShowsCubit extends Cubit<GenreShowsState> {
  GenreShowsCubit(
    this.homeRepo,
  ) : super(GenreShowsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchGenreShows({required String genre}) async {
    emit(GenreShowsLoading());
    var result = await homeRepo.fetchGenreShows(genre);
    result.fold((failure) => emit(GenreShowsFailure(failure.errMessage)),
        (showList) => emit(GenreShowsSuccess(showList)));
  }
}
