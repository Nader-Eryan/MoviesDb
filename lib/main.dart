import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/utils/constants.dart';
import 'package:whats_for_tonight/features/home/presentation/manager/cubit/brightness_cubit.dart';

import 'features/home/presentation/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return SizeConfigInit(
      referenceHeight: 900,
      referenceWidth: 360,
      builder: (BuildContext context, Orientation orientation) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => BrightnessCubit(),
              child: const MaterialApp(),
            )
          ],
          child: BlocBuilder<BrightnessCubit, BrightnessState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
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
                    appBarTheme: const AppBarTheme(
                        backgroundColor: kPrimaryDarkTheme, elevation: 0)),
                home: const HomeView(),
              );
            },
          ),
        );
      },
    );
  }
}
