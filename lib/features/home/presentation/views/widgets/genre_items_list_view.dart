import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/features/home/presentation/views/widgets/genre_item.dart';

class GenreItemsListView extends StatefulWidget {
  const GenreItemsListView({super.key});

  @override
  State<GenreItemsListView> createState() => _GenreItemsListViewState();
}

class _GenreItemsListViewState extends State<GenreItemsListView> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      controller.animateTo(controller.offset + 208,
          duration: const Duration(milliseconds: 1500),
          curve: Curves.decelerate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      width: 360.w,
      child: Expanded(
          child: ScrollSnapList(
        scrollPhysics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const GenreItem(),
        itemSize: 200.w,
        dynamicItemSize: true,
        itemCount: 100,
        listController: controller,
        onItemFocus: (_) {},
      )),
    );
  }
}
