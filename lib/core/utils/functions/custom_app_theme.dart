import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_for_tonight/core/utils/constants.dart';

import '../../../features/home/presentation/manager/cubit/brightness_cubit.dart';

ThemeData customAppTheme(BuildContext context) {
  return ThemeData(
    tabBarTheme: const TabBarTheme(
      labelColor: kActiveIcon,
    ),
    brightness: BlocProvider.of<BrightnessCubit>(context).isDark
        ? Brightness.dark
        : Brightness.light,
    fontFamily: 'Montserrat',
    primaryColorDark: kPrimaryDarkTheme,
    primaryColorLight: kPrimaryLightTheme,
    scaffoldBackgroundColor: kPrimaryDarkTheme,
    appBarTheme:
        const AppBarTheme(backgroundColor: kPrimaryDarkTheme, elevation: 0),
  );
}
