import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_for_tonight/core/utils/constants.dart';

import '../../../features/home/presentation/manager/cubit/brightness_cubit.dart';

ThemeData customAppTheme(BuildContext context) {
  final isDark = BlocProvider.of<BrightnessCubit>(context, listen: true).isDark;
  return ThemeData(
    navigationBarTheme: NavigationBarThemeData(
        indicatorColor: Colors.yellowAccent.withOpacity(0.2)),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: isDark ? kPrimaryLightTheme : kPrimaryDarkTheme,
      labelColor: kActiveIcon,
    ),
    brightness: isDark ? Brightness.dark : Brightness.light,
    fontFamily: 'Montserrat',
    primaryColorDark: kPrimaryDarkTheme,
    primaryColorLight: kPrimaryLightTheme,
    scaffoldBackgroundColor: isDark ? kPrimaryDarkTheme : kPrimaryLightTheme,
    appBarTheme: AppBarTheme(
        backgroundColor: isDark ? kPrimaryDarkTheme : kPrimaryLightTheme,
        elevation: 0),
    primarySwatch: Colors.amber,
  );
}
