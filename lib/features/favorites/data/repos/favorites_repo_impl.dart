import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:whats_for_tonight/core/utils/api_service.dart';
import 'package:whats_for_tonight/features/favorites/data/repos/favorites_repo.dart';

import '../../../../core/errors/failures.dart';
import '../../../home/data/models/show/show.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final CollectionReference _favoritesRef =
      FirebaseFirestore.instance.collection('favorites');
  final ApiService apiService;

  FavoritesRepoImpl(this.apiService);
  @override
  Future<void> addShow({required String id}) async {
    _favoritesRef.doc(id).set({'id': id});
  }

  @override
  Future<void> delShow({required String id}) async {
    _favoritesRef.doc(id).delete();
  }

  @override
  Future<bool> showExists({required String id}) async {
    return _favoritesRef.doc(id).get().then((value) => value.exists);
  }

  @override
  Future<List<String>> getShowsId() async {
    QuerySnapshot querySnapshot = await _favoritesRef.get();
    final List<String> data =
        querySnapshot.docs.map((doc) => doc.data().toString()).toList();
    return data;
  }

  @override
  Future<Either<Failure, Show>> fetchShowById({required String id}) async {
    try {
      var data = await apiService.searchById(id: id);

      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
