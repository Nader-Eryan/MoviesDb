import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../home/data/models/show/show.dart';

abstract class FavoritesRepo {
  Future<void> addShow({required String id, required String uid});
  Future<void> delShow({required String id, required String uid});
  Future<bool> showExists({required String id, required String uid});
  Future<List<String>> getShowsId({required String uid});
  Future<Either<Failure, Show>> fetchShowById({required String id});
}
