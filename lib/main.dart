import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/features/home/presentation/manager/cubit/brightness_cubit.dart';

import 'core/utils/functions/custom_app_theme.dart';
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
                theme: customAppTheme(context),
                home: const HomeView(),
              );
            },
          ),
        );
      },
    );
  }
}
