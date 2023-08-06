import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'Navigate to your profile page to update your picture',
          style: TextStyle(fontSize: 16),
        )));
      },
      child: const CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage('assets/images/profile.jpg'),
      ),
    );
  }
}
