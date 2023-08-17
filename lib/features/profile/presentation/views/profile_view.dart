import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_for_tonight/core/manager/language_cubit/language_cubit.dart';
import 'package:whats_for_tonight/core/utils/constants.dart';
import 'package:whats_for_tonight/core/utils/styles.dart';
import 'package:whats_for_tonight/core/widgets/profile_pic.dart';
import 'package:whats_for_tonight/features/profile/presentation/views/about_view.dart';
import 'package:whats_for_tonight/features/profile/presentation/views/account_view.dart';
import 'package:whats_for_tonight/features/profile/presentation/views/bookmarks_view.dart';

import '../../../../core/manager/brightness_cubit/brightness_cubit.dart';
import '../../../../generated/l10n.dart';

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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AccountView()));
                    },
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(
                            S.of(context).Account,
                            style: Styles.textStyleBold18,
                          ),
                        ],
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
                        Text(
                          S.of(context).AppTheme,
                          style: Styles.textStyleBold18,
                        ),
                        BlocBuilder<BrightnessCubit, BrightnessState>(
                          builder: (context, state) {
                            return DropdownButton(
                                iconSize: 40,
                                iconEnabledColor: kActiveIcon,
                                items: [
                                  DropdownMenuItem(
                                    value: 'light',
                                    child: Text(
                                      S.of(context).Light,
                                      style: Styles.textStyleBold16,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'dark',
                                    child: Text(
                                      S.of(context).Dark,
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
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).Language,
                          style: Styles.textStyleBold18,
                        ),
                        BlocBuilder<LanguageCubit, LanguageState>(
                          builder: (context, state) {
                            return DropdownButton(
                                iconSize: 40,
                                iconEnabledColor: kActiveIcon,
                                items: const [
                                  DropdownMenuItem(
                                    value: 'en',
                                    child: Text(
                                      'English',
                                      style: Styles.textStyleBold16,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'ar',
                                    child: Text(
                                      'عربى',
                                      style: Styles.textStyleBold16,
                                    ),
                                  ),
                                ],
                                onChanged: (val) {
                                  BlocProvider.of<LanguageCubit>(context)
                                      .switchLanguage(val);
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
                              builder: (context) => const BookmarksView()));
                    },
                    child: ListTile(
                      title: Text(
                        S.of(context).Bookmarks,
                        style: Styles.textStyleBold18,
                      ),
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
                    child: ListTile(
                      title: Text(
                        S.of(context).Abount,
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
