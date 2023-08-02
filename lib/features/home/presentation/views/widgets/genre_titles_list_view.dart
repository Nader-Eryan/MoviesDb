import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import '../../../../../core/utils/styles.dart';

class GenreTitlesListView extends StatelessWidget {
  const GenreTitlesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      height: 100.h,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextButton(
            child: const Text(
              'Genre',
              style: Styles.textStyleBold18,
            ),
            onPressed: () {},
          ),
        ),
        itemCount: 10,
      ),
    );
  }
}
