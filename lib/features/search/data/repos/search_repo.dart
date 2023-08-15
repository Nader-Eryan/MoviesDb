import 'package:dartz/dartz.dart';
import 'package:whats_for_tonight/core/errors/failures.dart';
import 'package:whats_for_tonight/features/home/data/models/show/show.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<Show>>> searchShow({required String showName});
}
