import 'dart:io';

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
    getImage();
    super.initState();
  }

  void getImage() async {
    profilePicPath = await getProfileImage();
    if (mounted) {
      setState(() {});
    }
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
        backgroundImage: profilePicPath != null
            ? FileImage(File(profilePicPath!))
            : const AssetImage('assets/images/profile.jpg') as ImageProvider,
      ),
    );
  }
}
