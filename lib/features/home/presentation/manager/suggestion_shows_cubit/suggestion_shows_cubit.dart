// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whats_for_tonight/features/home/data/repos/home_repo.dart';

import '../../../data/models/show/show.dart';

part 'suggestion_shows_state.dart';

class SuggestionShowsCubit extends Cubit<SuggestionShowsState> {
  SuggestionShowsCubit(
    this.homeRepo,
  ) : super(SuggestionShowsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSuggestionShows({String? list}) async {
    emit(SuggestionShowsLoading());
    var result = await homeRepo.fetchSuggestionShows(list: list);
    result.fold((failure) => emit(SuggestionShowsFailure(failure.errMessage)),
        (showList) => SuggestionShowsSuccess(showList));
  }
}
