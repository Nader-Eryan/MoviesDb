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
  Future<void> addShow({required String id, required String uid}) async {
    _favoritesRef.doc().set({'id': id, 'uid': uid});
  }

  @override
  Future<void> delShow({required String id, required String uid}) async {
    _favoritesRef
        .where('id', isEqualTo: id)
        .where('uid', isEqualTo: uid)
        .get()
        .then((snapshot) {
      for (var doc in snapshot.docs) {
        doc.reference.delete();
      }
    });
  }

  @override
  Future<bool> showExists({required String id, required String uid}) async {
    return _favoritesRef
        .where('id', isEqualTo: id)
        .where('uid', isEqualTo: uid)
        .get()
        .then((snapshot) {
      return snapshot.docs.isNotEmpty;
    });
  }

  @override
  Future<List<String>> getShowsId({required String uid}) async {
    QuerySnapshot querySnapshot =
        await _favoritesRef.where('uid', isEqualTo: uid).get();
    final List<String> data =
        querySnapshot.docs.map((doc) => doc.get('id').toString()).toList();
    return data;
  }

  @override
  Future<Either<Failure, Show>> fetchShowById({required String id}) async {
    try {
      var data = await apiService.searchById(id: id);
      Show show = Show.fromJson(data['results']);
      return right(show);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
