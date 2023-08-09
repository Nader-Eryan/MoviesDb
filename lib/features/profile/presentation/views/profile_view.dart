import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_for_tonight/core/utils/constants.dart';
import 'package:whats_for_tonight/core/utils/styles.dart';
import 'package:whats_for_tonight/core/widgets/profile_pic.dart';
import 'package:whats_for_tonight/features/home/presentation/manager/cubit/brightness_cubit.dart';
import 'package:whats_for_tonight/features/profile/presentation/views/about_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            Expanded(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  InkWell(
                    onTap: () {},
                    child: const ListTile(
                      title: Text(
                        'Account',
                        style: Styles.textStyleBold18,
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'App Theme',
                          style: Styles.textStyleBold18,
                        ),
                        BlocBuilder<BrightnessCubit, BrightnessState>(
                          builder: (context, state) {
                            return DropdownButton(
                                iconEnabledColor: kActiveIcon,
                                items: const [
                                  DropdownMenuItem(
                                    value: 'light',
                                    child: Text(
                                      'Light',
                                      style: Styles.textStyleBold16,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'dark',
                                    child: Text(
                                      'Dark',
                                      style: Styles.textStyleBold16,
                                    ),
                                  ),
                                ],
                                onChanged: (val) {
                                  BlocProvider.of<BrightnessCubit>(context)
                                      .switchBrightnessMode(val);
                                });
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutView()));
                    },
                    child: const ListTile(
                      title: Text(
                        'About',
                        style: Styles.textStyleBold18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
