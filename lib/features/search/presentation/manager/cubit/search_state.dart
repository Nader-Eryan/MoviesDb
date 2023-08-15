// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Show> searchList;
  SearchSuccess({
    required this.searchList,
  });
}

class SearchFailure extends SearchState {
  final String errMessage;

  SearchFailure(this.errMessage);
}

class SearchLoading extends SearchState {}
