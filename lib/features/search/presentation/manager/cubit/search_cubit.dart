import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whats_for_tonight/features/home/data/models/show/show.dart';
import 'package:whats_for_tonight/features/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;
  SearchCubit({
    required this.searchRepo,
  }) : super(SearchInitial());
  Future<void> searchShow({required String showName}) async {
    emit(SearchLoading());
    var result = await searchRepo.searchShow(showName: showName);
    result.fold((failure) => emit(SearchFailure(failure.errMessage)),
        (showList) => emit(SearchSuccess(searchList: showList)));
  }
}
