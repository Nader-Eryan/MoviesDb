import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/manager/language_cubit/language_cubit.dart';
import 'package:whats_for_tonight/features/home/presentation/views/splash_view.dart';

import 'core/manager/brightness_cubit/brightness_cubit.dart';
import 'core/utils/functions/custom_app_theme.dart';
import 'generated/l10n.dart';

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
            ),
            BlocProvider(
              create: (_) => LanguageCubit(),
              child: const MaterialApp(),
            ),
          ],
          child: BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return BlocBuilder<BrightnessCubit, BrightnessState>(
                builder: (context, state) {
                  return MaterialApp(
                    locale: Locale(
                        BlocProvider.of<LanguageCubit>(context).isEnglish
                            ? 'en'
                            : 'ar'),
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    debugShowCheckedModeBanner: false,
                    theme: customAppTheme(context),
                    home: const SplashView(),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
