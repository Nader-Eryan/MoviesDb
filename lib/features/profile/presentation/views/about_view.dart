import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:size_config/size_config.dart';

import 'package:whats_for_tonight/core/widgets/back_arrow_icon.dart';

import '../../../../core/utils/functions/launch_mail.dart';
import '../../../../core/utils/styles.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});
  Future<String> getVersionNum() async {
    final info = await PackageInfo.fromPlatform();
    return info.version;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BackArrowIcon(onPressed: () {
              Navigator.pop(context);
            }),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Version',
                    style: Styles.textStyleBold18,
                  ),
                  FutureBuilder(
                      future: getVersionNum(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Text(snapshot.data!);
                        } else {
                          return const Icon(Icons.error_outline);
                        }
                      })
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
                  const Text(
                    'Feedback',
                    style: Styles.textStyleBold18,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        // To create email with params
                        launchMail();
                      },
                      child: const Text(
                        'Email us',
                        style: Styles.textStyleBold16,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
