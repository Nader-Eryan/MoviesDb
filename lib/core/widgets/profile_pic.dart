import 'package:flutter/material.dart';
import 'package:whats_for_tonight/features/profile/presentation/views/widgets/image_capture.dart';

import '../../generated/l10n.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key, this.isProfileView});
  final bool? isProfileView;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isProfileView == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                S.of(context).NavToProfileToUpdatePic,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ImageCapture()));
        }
      },
      child: const CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage('assets/images/profile.jpg'),
      ),
    );
  }
}
