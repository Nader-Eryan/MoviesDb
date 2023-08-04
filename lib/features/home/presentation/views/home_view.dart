import 'package:flutter/material.dart';

import '../../../../core/utils/functions/custom_app_bar.dart';
import '../../../custom_button_navigation.dart/presentation/views/widgets/custom_bottom_navigation.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final TabController _tabController;
  late final ScrollController bottomScrollController;
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
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigation(),
      appBar: customAppBar(list, _tabController),
      body: HomeViewBody(
        tabController: _tabController,
        bottomScrollController: bottomScrollController,
      ),
    );
  }
}
