import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whats_for_tonight/features/custom_button_navigation.dart/presentation/manager/cubit/page_index_cubit.dart';
import 'package:whats_for_tonight/features/favorites/presentation/views/favorites_view.dart';
import 'package:whats_for_tonight/features/home/presentation/manager/cubit/brightness_cubit.dart';
import 'package:whats_for_tonight/features/search/presentation/views/search_view.dart';

import '../../../../core/utils/functions/custom_app_bar.dart';
import '../../../custom_button_navigation.dart/presentation/views/widgets/custom_bottom_navigation.dart';
import '../../../profile/presentation/views/profile_view.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final TabController _tabController;
  late final ScrollController bottomScrollController;
  int currentPageIndex = 0;
  List<Widget> list = [
    const Text('Action'),
    const Text('Drama'),
    const Text('Horrer'),
    const Text('Mystery'),
    const Text('Thriller')
  ];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BrightnessCubit>(context).sharedPrefsInit();
    _tabController = TabController(length: 5, vsync: this);
    bottomScrollController = ScrollController();
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
        return Scaffold(
            bottomNavigationBar: const CustomBottomNavigation(),
            appBar: customAppBar(context, list, _tabController),
            body: [
              HomeViewBody(
                tabController: _tabController,
                bottomScrollController: bottomScrollController,
              ),
              const SearchView(),
              const FavoritesView(),
              const ProfileView(),
            ][BlocProvider.of<PageIndexCubit>(context).currentPageIndex]);
      },
    );
  }
}
