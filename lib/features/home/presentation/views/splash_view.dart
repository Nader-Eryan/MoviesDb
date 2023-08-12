import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/manager/language_cubit/language_cubit.dart';
import 'package:whats_for_tonight/features/home/presentation/views/home_view.dart';

import '../../../../core/manager/brightness_cubit/brightness_cubit.dart';
import '../../../custom_button_navigation.dart/presentation/manager/cubit/page_index_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double padding = 100;
  late Timer timer;
  @override
  void initState() {
    BlocProvider.of<BrightnessCubit>(context).sharedPrefsBrightnessInit();
    BlocProvider.of<LanguageCubit>(context).sharedPrefsLanguageInit();

    padding = 0;
    timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      padding = padding == 0 ? 100 : 0;
      setState(() {});
    });
    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => PageIndexCubit(), child: const HomeView())));
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //bool isDark = BlocProvider.of<BrightnessCubit>(context).isDark;
    return SafeArea(
      child: Scaffold(
          //backgroundColor: isDark ? kPrimaryDarkTheme : kPrimaryLightTheme,
          body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 260.h,
            ),
            AnimatedPadding(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 400),
              padding: EdgeInsets.all(padding),
              child: Image.asset('assets/images/moviesdb.png'),
            ),
          ],
        ),
      )),
    );
  }
}
