import 'package:flutter/material.dart';
import 'package:whats_for_tonight/features/profile/presentation/views/widgets/image_capture.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key, this.isProfileView});
  final bool? isProfileView;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isProfileView == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Navigate to your profile page to update your picture',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ImageCapture()));
        }
      },
      child: const CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage('assets/images/profile.jpg'),
      ),
    );
  }
}
