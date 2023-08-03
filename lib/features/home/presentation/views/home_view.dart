import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/utils/constants.dart';

import '../../../../core/utils/styles.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final TabController _tabController;
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
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        elevation: 0,
        title: const Text(
          'MoviesDb',
          style: Styles.textStyleBold20,
        ),
        bottom: TabBar(
          padding: const EdgeInsets.symmetric(vertical: 2),
          unselectedLabelColor: Colors.white,
          indicatorColor: kActiveIcon,
          labelStyle:
              Styles.textStyleBold16.copyWith(fontWeight: FontWeight.w500),
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          controller: _tabController,
          tabs: list,
        ),
        centerTitle: true,
        actions: const [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/images/perAvr.png'),
          ),
          SizedBox(
            width: 12,
          )
        ],
      ),
      body: HomeViewBody(
        tabController: _tabController,
      ),
    );
  }
}
