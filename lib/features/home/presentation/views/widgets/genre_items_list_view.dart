import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/utils/styles.dart';
import 'package:whats_for_tonight/core/widgets/item_details.dart';
import 'package:whats_for_tonight/core/widgets/list_item.dart';

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
      child: ScrollSnapList(
        padding: const EdgeInsets.all(0),
        scrollPhysics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ItemDetails()));
          },
          child: Stack(fit: StackFit.values.last, children: [
            const ListItem(),
            Positioned(
                left: 20.w,
                top: 240.h,
                child: SizedBox(
                  width: 160.w,
                  child: const Text(
                    'Movie title Movieffs title Movie title',
                    style: Styles.textStyleBold28,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )),
          ]),
        ),
        itemSize: 200.w,
        dynamicItemSize: true,
        itemCount: 100,
        listController: controller,
        onItemFocus: (_) {},
        onReachEnd: () {
          periodicTimer.cancel();
        },
      ),
    );
  }
}
