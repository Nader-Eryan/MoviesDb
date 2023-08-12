import 'package:flutter/material.dart';
import 'package:whats_for_tonight/core/utils/functions/get_version.dart';

import '../../../../core/utils/functions/custom_arrow_back_app_bar.dart';
import '../../../../core/utils/functions/launch_mail.dart';
import '../../../../core/utils/styles.dart';
import '../../../../generated/l10n.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customArrowBackAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 30,
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).Version,
                      style: Styles.textStyleBold18,
                    ),
                    FutureBuilder(
                        future: getVersionNum(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
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
                    Text(
                      S.of(context).Feedback,
                      style: Styles.textStyleBold18,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          // To create email with params
                          launchMail();
                        },
                        child: Text(
                          S.of(context).EmailUs,
                          style: Styles.textStyleBold16,
                        ))
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
