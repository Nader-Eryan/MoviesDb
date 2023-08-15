// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whats_for_tonight/features/home/data/repos/home_repo.dart';

part 'genre_names_state.dart';

class GenreNamesCubit extends Cubit<GenreNamesState> {
  GenreNamesCubit(
    this.homeRepo,
  ) : super(GenreNamesInitial());
  List<String> genreNames = [];
  final HomeRepo homeRepo;
  Future<void> fetchGenreNames() async {
    emit(GenreNamesLoading());
    var result = await homeRepo.fetchgenreNames();
    result.fold((failure) => emit(GenreNamesFailure(failure.errMessage)),
        (genreList) {
      genreNames = genreList;
      emit(GenreNamesSuccess(genreList));
    });
  }
}
