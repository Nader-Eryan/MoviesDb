import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/widgets/profile_pic.dart';
import 'package:whats_for_tonight/features/custom_button_navigation.dart/presentation/manager/cubit/page_index_cubit.dart';

import '../../manager/brightness_cubit/brightness_cubit.dart';
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
          title: Row(
            children: [
              ClipRRect(
                child: Image.asset('assets/images/logo.png',
                    width: 120.0.w, fit: BoxFit.contain),
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
          actions: const [
            ProfilePic(),
            SizedBox(
              width: 16,
            )
          ],
        )
      : null;
}
