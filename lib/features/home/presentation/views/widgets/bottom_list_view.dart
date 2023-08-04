import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/utils/styles.dart';

import 'genre_item.dart';

class BottomListView extends StatelessWidget {
  const BottomListView({super.key, required this.bottomScrollController});

  final ScrollController bottomScrollController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 235.h,
          child: ListView.builder(
            controller: bottomScrollController,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: GenreItem(
                  width: 140.w,
                ),
              );
            }),
          ),
        ),
        const SizedBox(
          width: 130,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              'Movie title Movie title movie',
              style: Styles.textStyleBold16,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
