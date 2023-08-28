import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:whats_for_tonight/core/utils/styles.dart';
import 'package:whats_for_tonight/core/widgets/profile_pic.dart';
import 'package:whats_for_tonight/features/profile/presentation/views/about_view.dart';
import 'package:whats_for_tonight/features/profile/presentation/views/account_view.dart';

import '../../../../generated/l10n.dart';
import 'widgets/brightness_section.dart';
import 'widgets/language_section.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    const BrightnessSection(),
                    const Divider(
                      thickness: 2,
                    ),
                    const LanguageSection(),
                    const Divider(
                      thickness: 2,
                    ),
                    InkWell(
                      onTap: () {
                        Share.shareUri(Uri.parse(
                            'https://drive.google.com/drive/folders/1Msx8AYG_XGBIE7NREo3aJxTDkIxAGQQ_?usp=sharing'));
                      },
                      child: ListTile(
                        title: Text(
                          S.of(context).ShareTheApp,
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
      ),
    );
  }
}
