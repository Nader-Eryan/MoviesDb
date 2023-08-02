import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/features/home/presentation/views/widgets/genre_item.dart';

class GenreItemsListView extends StatelessWidget {
  const GenreItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      width: 360.w,
      child: Expanded(
          child: ScrollSnapList(
        scrollPhysics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: GenreItem(),
        ),
        itemSize: 208.w,
        dynamicItemSize: true,
        itemCount: 100,
        onItemFocus: (_) {},
      )),
    );
  }
}
