import 'package:dartz/dartz.dart';
import 'package:whats_for_tonight/core/errors/failures.dart';
import 'package:whats_for_tonight/features/home/data/models/show/show.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Show>>> fetchGenreShows(String genre);
  Future<Either<Failure, List<Show>>> fetchSuggestionShows({String? list});
  Future<Either<Failure, List<String>>> fetchgenreNames();
}
