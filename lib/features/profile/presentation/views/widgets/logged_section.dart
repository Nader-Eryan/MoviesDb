import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/features/profile/presentation/views/widgets/custom_button.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../generated/l10n.dart';

class LoggedSection extends StatelessWidget {
  const LoggedSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 200.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              S.of(context).AlreadySignedIn,
              style: Styles.textStyleBold18,
            ),
            const SizedBox(
              height: 80,
            ),
            customButton(kActiveIcon, S.of(context).SignOut, () async {
              await FirebaseAuth.instance.signOut();
            })
          ],
        ),
      ),
    ));
  }
}
