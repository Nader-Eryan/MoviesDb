part of 'genre_shows_cubit.dart';

@immutable
abstract class GenreShowsState {}

class GenreShowsInitial extends GenreShowsState {}

class GenreShowsLoading extends GenreShowsState {}

class GenreShowsFailure extends GenreShowsState {
  final String errMessage;

  GenreShowsFailure(this.errMessage);
}

class GenreShowsSuccess extends GenreShowsState {
  final List<Show> showList;

  GenreShowsSuccess(this.showList);
}
