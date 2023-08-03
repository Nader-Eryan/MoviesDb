import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import '../constants.dart';
import '../styles.dart';

AppBar customAppBar(List<Widget> list, TabController tabController) {
  return AppBar(
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
      labelStyle: Styles.textStyleBold16.copyWith(fontWeight: FontWeight.w500),
      indicatorSize: TabBarIndicatorSize.label,
      isScrollable: true,
      controller: tabController,
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
  );
}
