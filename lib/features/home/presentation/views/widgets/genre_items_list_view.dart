import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/features/home/presentation/views/widgets/genre_item.dart';

class GenreItemsListView extends StatelessWidget {
  const GenreItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      height: 300.h,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: TextButton(
            child: const GenreItem(),
            onPressed: () {},
          ),
        ),
        itemCount: 10,
      ),
    );
  }
}
