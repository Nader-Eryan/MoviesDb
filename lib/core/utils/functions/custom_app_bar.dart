import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:size_config/size_config.dart';

import '../../../features/home/presentation/manager/cubit/brightness_cubit.dart';
import '../constants.dart';
import '../styles.dart';

AppBar customAppBar(
    BuildContext ctx, List<Widget> list, TabController tabController) {
  return AppBar(
    systemOverlayStyle:
        SystemUiOverlayStyle.light.copyWith(statusBarColor: kPrimaryDarkTheme),
    toolbarHeight: 90.h,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: Image.asset('assets/images/logo.jpg',
              height: 50.0, width: 50.0, fit: BoxFit.contain),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          'MoviesDb',
          style: Styles.textStyleBold20.copyWith(
              color: BlocProvider.of<BrightnessCubit>(ctx).isDark
                  ? kPrimaryLightTheme
                  : kPrimaryDarkTheme),
        ),
      ],
    ),
    bottom: TabBar(
      padding: const EdgeInsets.symmetric(vertical: 2),
      unselectedLabelColor: BlocProvider.of<BrightnessCubit>(ctx).isDark
          ? Colors.white
          : Colors.black,
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
        radius: 22,
        backgroundImage: AssetImage('assets/images/perAvr.png'),
      ),
      SizedBox(
        width: 12,
      )
    ],
  );
}
