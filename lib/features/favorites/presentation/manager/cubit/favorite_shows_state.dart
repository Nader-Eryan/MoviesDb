part of 'favorite_shows_cubit.dart';

abstract class FavoriteShowsState {}

class FavoriteShowsInitial extends FavoriteShowsState {}

class FavoriteShowsFailure extends FavoriteShowsState {
  final String errMessage;

  FavoriteShowsFailure(this.errMessage);
}

class FavoriteShowsSuccess extends FavoriteShowsState {
  Show show;
  FavoriteShowsSuccess({
    required this.show,
  });
}

class FavoriteShowsLoading extends FavoriteShowsState {}
