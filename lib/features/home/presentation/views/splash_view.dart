import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/manager/language_cubit/language_cubit.dart';
import 'package:whats_for_tonight/core/utils/service_locator.dart';
import 'package:whats_for_tonight/features/home/data/repos/home_repo_impl.dart';
import 'package:whats_for_tonight/features/home/presentation/manager/genre_names_cubit/genre_names_cubit.dart';
import 'package:whats_for_tonight/features/home/presentation/manager/genre_shows_cubit/genre_shows_cubit.dart';
import 'package:whats_for_tonight/features/home/presentation/manager/suggestion_shows_cubit/suggestion_shows_cubit.dart';
import 'package:whats_for_tonight/features/home/presentation/views/home_view.dart';

import '../../../../core/manager/brightness_cubit/brightness_cubit.dart';
import '../../../custom_button_navigation.dart/presentation/manager/cubit/page_index_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double padding = 100;
  late Timer timer;
  @override
  void initState() {
    BlocProvider.of<BrightnessCubit>(context).sharedPrefsBrightnessInit();
    BlocProvider.of<LanguageCubit>(context).sharedPrefsLanguageInit();
    cacheClear();
    padding = 0;
    timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      padding = padding == 0 ? 100 : 0;
      setState(() {});
    });
    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
                BlocProvider(create: (context) => PageIndexCubit()),
                BlocProvider(
                    create: (context) =>
                        GenreNamesCubit(getIt.get<HomeRepoImpl>())
                          ..fetchGenreNames()),
                BlocProvider(
                    create: (context) =>
                        GenreShowsCubit(getIt.get<HomeRepoImpl>())),
                BlocProvider(
                    create: (context) =>
                        SuggestionShowsCubit(getIt.get<HomeRepoImpl>())
                          ..fetchSuggestionShows()),
              ], child: const HomeView())));
    });
    super.initState();
  }

  Future<void> cacheClear() async {
    await DefaultCacheManager().emptyCache();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 260.h,
            ),
            AnimatedPadding(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 400),
              padding: EdgeInsets.all(padding),
              child: Image.asset('assets/images/moviesdb.png'),
            ),
          ],
        ),
      )),
    );
  }
}
