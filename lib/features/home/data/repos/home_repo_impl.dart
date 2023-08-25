import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:whats_for_tonight/core/utils/api_service.dart';
import 'package:whats_for_tonight/features/home/data/models/show/show.dart';
import 'package:whats_for_tonight/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:whats_for_tonight/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  int rand = Random().nextInt(30) + 1;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Show>>> fetchGenreShows(String genre) async {
    try {
      var data = await apiService.get(
        qParams: {
          'genre': genre,
          'limit': 15,
          'startYear': 2000,
          'page': rand,
        },
        endPoint: '/titles',
      );
      List<Show> shows = [];
      for (var show in data['results']) {
        shows.add(Show.fromJson(show));
      }
      return right(shows);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Show>>> fetchSuggestionShows(
      {String? list}) async {
    try {
      var data = await apiService.get(
          qParams: {'list': list ?? 'top_rated_english_250'},
          endPoint: '/titles/random');
      List<Show> shows = [];
      for (var show in data['results']) {
        shows.add(Show.fromJson(show));
      }
      return right(shows);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> fetchgenreNames() async {
    try {
      var data = await apiService.get(endPoint: '/titles/utils/genres');
      List<String> genreList = [];
      //print(data);
      for (var item in data['results']) {
        if (json.encode(item) != 'null' && json.encode(item) != '"Adult"') {
          genreList.add(json.encode(item).replaceAll('"', ''));
        }
      }
      return right(genreList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
