import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whats_for_tonight/core/utils/api_service.dart';
import 'package:whats_for_tonight/features/favorites/data/repos/favorites_repo_impl.dart';
import 'package:whats_for_tonight/features/home/data/repos/home_repo_impl.dart';
import 'package:whats_for_tonight/features/search/data/repos/search_repo_impl.dart';

final getIt = GetIt.instance;

void serviceLocatorSetup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<SearchRepoImpl>(
      SearchRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<FavoritesRepoImpl>(
      FavoritesRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<Future<SharedPreferences>>(
      SharedPreferences.getInstance());
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
}
