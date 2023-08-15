import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:whats_for_tonight/core/errors/failures.dart';
import 'package:whats_for_tonight/core/utils/api_service.dart';
import 'package:whats_for_tonight/features/home/data/models/show/show.dart';
import 'package:whats_for_tonight/features/search/data/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  ApiService apiService;
  SearchRepoImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, List<Show>>> searchShow(
      {required String showName}) async {
    try {
      var data = await apiService.search(showName: showName);
      List<Show> searchList = [];
      //print(data);
      for (var item in data['results']) {
        searchList.add(Show.fromJson(item));
      }
      return right(searchList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
