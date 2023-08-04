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
  late Timer periodicTimer;
  @override
  void initState() {
    super.initState();
    periodicTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (controller.hasClients) {
        controller.animateTo(controller.offset + 208.w,
            duration: const Duration(milliseconds: 1300),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: Expanded(
          child: ScrollSnapList(
        scrollPhysics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const GenreItem(),
        itemSize: 200.w,
        dynamicItemSize: true,
        itemCount: 100,
        listController: controller,
        onItemFocus: (_) {},
        onReachEnd: () {
          periodicTimer.cancel();
        },
      )),
    );
  }
}
