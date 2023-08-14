part of 'genre_names_cubit.dart';

class GenreNamesState {}

class GenreNamesInitial extends GenreNamesState {}

class GenreNamesLoading extends GenreNamesState {}

class GenreNamesSuccess extends GenreNamesState {
  final List<String> genreList;

  GenreNamesSuccess(this.genreList);
}

class GenreNamesFailure extends GenreNamesState {
  final String errMessage;

  GenreNamesFailure(this.errMessage);
}
