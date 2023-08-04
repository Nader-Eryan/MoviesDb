import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_for_tonight/core/utils/constants.dart';

import '../../../features/home/presentation/manager/cubit/brightness_cubit.dart';

ThemeData customAppTheme(BuildContext context) {
  return ThemeData(
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: BlocProvider.of<BrightnessCubit>(context).isDark
          ? kPrimaryLightTheme
          : kPrimaryDarkTheme,
      labelColor: kActiveIcon,
    ),
    brightness: BlocProvider.of<BrightnessCubit>(context).isDark
        ? Brightness.dark
        : Brightness.light,
    fontFamily: 'Montserrat',
    primaryColorDark: kPrimaryDarkTheme,
    primaryColorLight: kPrimaryLightTheme,
    scaffoldBackgroundColor: BlocProvider.of<BrightnessCubit>(context).isDark
        ? kPrimaryDarkTheme
        : kPrimaryLightTheme,
    appBarTheme: AppBarTheme(
        backgroundColor: BlocProvider.of<BrightnessCubit>(context).isDark
            ? kPrimaryDarkTheme
            : kPrimaryLightTheme,
        elevation: 0),
  );
}
