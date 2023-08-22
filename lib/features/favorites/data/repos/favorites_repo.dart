import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../home/data/models/show/show.dart';

abstract class FavoritesRepo {
  Future<void> addShow({required String id});
  Future<void> delShow({required String id});
  Future<bool> showExists({required String id});
  Future<List<String>> getShowsId();
  Future<Either<Failure, Show>> fetchShowById({required String id});
}
