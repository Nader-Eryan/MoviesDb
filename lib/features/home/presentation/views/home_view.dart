import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_for_tonight/core/utils/api_service.dart';
import 'package:whats_for_tonight/core/utils/service_locator.dart';
import 'package:whats_for_tonight/features/custom_button_navigation.dart/presentation/manager/cubit/page_index_cubit.dart';
import 'package:whats_for_tonight/features/favorites/presentation/views/favorites_view.dart';
import 'package:whats_for_tonight/features/search/data/repos/search_repo.dart';
import 'package:whats_for_tonight/features/search/data/repos/search_repo_impl.dart';
import 'package:whats_for_tonight/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:whats_for_tonight/features/search/presentation/views/search_view.dart';

import '../../../../core/utils/functions/custom_app_bar.dart';
import '../../../custom_button_navigation.dart/presentation/views/widgets/custom_bottom_navigation.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../manager/genre_names_cubit/genre_names_cubit.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late TabController _tabController;
  late final ScrollController bottomScrollController;
  List<String> genreNames = [];
  int currentPageIndex = 0;
  @override
  void initState() {
    super.initState();
    bottomScrollController = ScrollController();
    _tabController = TabController(length: genreNames.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    bottomScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageIndexCubit, PageIndexState>(
      builder: (context, state) {
        return BlocListener<GenreNamesCubit, GenreNamesState>(
          listener: (context, state) {
            if (state is GenreNamesSuccess) {
              genreNames = BlocProvider.of<GenreNamesCubit>(context).genreNames;
              _tabController =
                  TabController(length: genreNames.length, vsync: this);
              setState(() {});
            }
          },
          child: Scaffold(
              bottomNavigationBar: const CustomBottomNavigation(),
              appBar: customAppBar(context, genreNames, _tabController),
              body: [
                HomeViewBody(
                  tabController: _tabController,
                  bottomScrollController: bottomScrollController,
                  genreNames: genreNames,
                ),
                BlocProvider(
                  create: (context) => SearchCubit(
                    searchRepo: getIt.get<SearchRepoImpl>(),
                  ),
                  child: const SearchView(),
                ),
                const FavoritesView(),
                const ProfileView(),
              ][BlocProvider.of<PageIndexCubit>(context).currentPageIndex]),
        );
      },
    );
  }
}
