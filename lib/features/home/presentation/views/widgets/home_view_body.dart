// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import 'package:whats_for_tonight/features/home/presentation/views/widgets/genre_items_list_view.dart';
import 'package:whats_for_tonight/features/home/presentation/views/widgets/text_row_home_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // SliverToBoxAdapter(
        //   child: GenreTitlesListView(),
        // ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 400.h,
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
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextRowHomeView(),
          ),
        ),
      ],
    );
  }
}
