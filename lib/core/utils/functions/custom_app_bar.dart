import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/features/custom_button_navigation.dart/presentation/manager/cubit/page_index_cubit.dart';

import '../../../features/home/presentation/manager/cubit/brightness_cubit.dart';
import '../constants.dart';
import '../styles.dart';

AppBar? customAppBar(
    BuildContext ctx, List<Widget> list, TabController tabController) {
  bool isDark = BlocProvider.of<BrightnessCubit>(ctx, listen: true).isDark;
  return BlocProvider.of<PageIndexCubit>(ctx).currentPageIndex == 0
      ? AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light
              .copyWith(statusBarColor: kPrimaryDarkTheme),
          toolbarHeight: 90.h,
          elevation: 0,
          title: Text(
            'MoviesDb',
            style: Styles.textStyleBold20
                .copyWith(color: isDark ? Colors.white : Colors.black),
          ),
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 2,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: Image.asset('assets/images/logo.jpg',
                    height: 50.0, width: 50.0, fit: BoxFit.contain),
              ),
            ],
          ),
          bottom: TabBar(
            padding: const EdgeInsets.symmetric(vertical: 2),
            unselectedLabelColor: isDark ? Colors.white : Colors.black,
            indicatorColor: kActiveIcon,
            labelStyle:
                Styles.textStyleBold18.copyWith(fontWeight: FontWeight.w500),
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            controller: tabController,
            tabs: list,
          ),
          centerTitle: true,
          actions: const [
            CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('assets/images/perAvr.png'),
            ),
            SizedBox(
              width: 12,
            )
          ],
        )
      : null;
}
