import 'package:flutter/material.dart';
import 'package:whats_for_tonight/core/utils/styles.dart';
import 'package:whats_for_tonight/features/home/presentation/views/widgets/genre_items_list_view.dart';

import 'genre_titles_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          elevation: 0,
          title: Text(
            'MoviesDb',
            style: Styles.textStyleBold20,
          ),
          centerTitle: true,
          actions: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/images/perAvr.png'),
            ),
            SizedBox(
              width: 12,
            )
          ],
        ),
        SliverToBoxAdapter(
          child: GenreTitlesListView(),
        ),
        SliverToBoxAdapter(
          child: GenreItemsListView(),
        ),
      ],
    );
  }
}
