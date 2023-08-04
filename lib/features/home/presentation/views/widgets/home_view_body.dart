// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import 'package:whats_for_tonight/features/home/presentation/views/widgets/genre_item.dart';
import 'package:whats_for_tonight/features/home/presentation/views/widgets/genre_items_list_view.dart';
import 'package:whats_for_tonight/features/home/presentation/views/widgets/text_row_home_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    Key? key,
    required this.tabController,
    required this.bottomScrollController,
  }) : super(key: key);
  final TabController tabController;
  final ScrollController bottomScrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 350.h,
            child: TabBarView(
              controller: tabController,
              children: const [
                GenreItemsListView(),
                GenreItemsListView(),
                GenreItemsListView(),
                GenreItemsListView(),
                GenreItemsListView(),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 22,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child:
                TextRowHomeView(bottomScrollController: bottomScrollController),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 240.h,
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
                })),
          ),
        ),
      ],
    );
  }
}
