import 'package:flutter/material.dart';
import 'package:whats_for_tonight/core/utils/functions/custom_snackbar.dart';
import 'package:whats_for_tonight/core/utils/functions/get_profile_image.dart';
import 'package:whats_for_tonight/features/profile/presentation/views/widgets/image_capture.dart';

import '../../generated/l10n.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({super.key, this.isProfileView});
  final bool? isProfileView;

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  String? profilePicPath;
  @override
  void initState() {
    super.initState();
  }

  void getProfileImage() async {
    // if (await isSignedIn() != null) {
    //   profilePicPath = await getProfileImageFromFirebase();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.isProfileView == null) {
          customSnackBar(context, S.of(context).NavToProfileToUpdatePic);
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ImageCapture()));
        }
      },
      child: CircleAvatar(
        radius: 24,
        backgroundImage:
            AssetImage(profilePicPath ?? 'assets/images/profile.jpg'),
      ),
    );
  }
}
