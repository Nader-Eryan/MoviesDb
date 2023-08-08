import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_for_tonight/core/widgets/profile_pic.dart';
import 'package:whats_for_tonight/features/home/presentation/manager/cubit/brightness_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                ProfilePic(
                  isProfileView: true,
                ),
              ],
            ),
            Center(
              child: BlocBuilder<BrightnessCubit, BrightnessState>(
                builder: (context, state) {
                  return Switch(
                      value: BlocProvider.of<BrightnessCubit>(context).isDark,
                      onChanged: (_) {
                        BlocProvider.of<BrightnessCubit>(context)
                            .switchBrightnessMode();
                      });
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}


/*
Center(
      child: BlocBuilder<BrightnessCubit, BrightnessState>(
        builder: (context, state) {
          return Switch(
              value: BlocProvider.of<BrightnessCubit>(context).isDark,
              onChanged: (_) {
                BlocProvider.of<BrightnessCubit>(context)
                    .switchBrightnessMode();
              });
        },
      ),
    )

 */