part of 'suggestion_shows_cubit.dart';

abstract class SuggestionShowsState {}

class SuggestionShowsInitial extends SuggestionShowsState {}

class SuggestionShowsLoading extends SuggestionShowsState {}

class SuggestionShowsFailure extends SuggestionShowsState {
  final String errMessage;

  SuggestionShowsFailure(this.errMessage);
}

class SuggestionShowsSuccess extends SuggestionShowsState {
  final List<Show> showList;

  SuggestionShowsSuccess(this.showList);
}
