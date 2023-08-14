import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:whats_for_tonight/core/utils/api_service.dart';
import 'package:whats_for_tonight/features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void serviceLocatorSetup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
}
