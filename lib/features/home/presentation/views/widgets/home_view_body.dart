// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/widgets/custom_error_widget.dart';
import 'package:whats_for_tonight/core/widgets/loading_widget.dart';
import 'package:whats_for_tonight/features/home/presentation/manager/genre_names_cubit/genre_names_cubit.dart';

import 'package:whats_for_tonight/features/home/presentation/views/widgets/genre_items_list_view.dart';
import 'package:whats_for_tonight/features/home/presentation/views/widgets/text_row_home_view.dart';

import 'bottom_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    Key? key,
    required this.tabController,
    required this.bottomScrollController,
    required this.genreNames,
  }) : super(key: key);
  final TabController tabController;
  final ScrollController bottomScrollController;
  final List<String> genreNames;
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
            height: 340.h,
            child: BlocBuilder<GenreNamesCubit, GenreNamesState>(
              builder: (context, state) {
                if (state is GenreNamesSuccess) {
                  return BlocBuilder<GenreNamesCubit, GenreNamesState>(
                    builder: (context, state) {
                      if (state is GenreNamesSuccess) {
                        return TabBarView(
                          controller: tabController,
                          children: List.generate(
                            genreNames.length,
                            (index) =>
                                GenreItemsListView(showName: genreNames[index]),
                          ),
                        );
                      } else if (state is GenreNamesFailure) {
                        return CustomErrorWidget(errMessage: state.errMessage);
                      } else {
                        return const CustomLoadingWidget();
                      }
                    },
                  );
                } else if (state is GenreNamesFailure) {
                  return CustomErrorWidget(errMessage: state.errMessage);
                } else {
                  return const CustomLoadingWidget();
                }
              },
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
            height: 260.h,
            child:
                BottomListView(bottomScrollController: bottomScrollController),
          ),
        ),
      ],
    );
  }
}
