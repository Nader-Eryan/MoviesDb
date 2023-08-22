// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whats_for_tonight/features/favorites/data/repos/favorites_repo.dart';

import '../../../../home/data/models/show/show.dart';

part 'favorite_shows_state.dart';

class FavoriteShowsCubit extends Cubit<FavoriteShowsState> {
  final FavoritesRepo favoritesRepo;
  FavoriteShowsCubit(
    this.favoritesRepo,
  ) : super(FavoriteShowsInitial());
  Future<void> fetchShow({required String id}) async {
    emit(FavoriteShowsLoading());
    var result = await favoritesRepo.fetchShowById(id: id);
    result.fold((failure) => emit(FavoriteShowsFailure(failure.errMessage)),
        (show) => emit(FavoriteShowsSuccess(show: show)));
  }
}
