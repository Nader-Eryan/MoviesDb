import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/utils/styles.dart';
import 'package:whats_for_tonight/core/widgets/custom_error_widget.dart';
import 'package:whats_for_tonight/features/home/presentation/manager/genre_shows_cubit/genre_shows_cubit.dart';
import 'package:whats_for_tonight/features/item_details/presentation/views/item_details.dart';
import 'package:whats_for_tonight/core/widgets/list_item.dart';

class GenreItemsListView extends StatefulWidget {
  const GenreItemsListView({super.key, required this.showName});
  final String showName;

  @override
  State<GenreItemsListView> createState() => _GenreItemsListViewState();
}

class _GenreItemsListViewState extends State<GenreItemsListView> {
  ScrollController controller = ScrollController();
  late Timer periodicTimer;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GenreShowsCubit>(context)
        .fetchGenreShows(genre: widget.showName);

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
      child: BlocBuilder<GenreShowsCubit, GenreShowsState>(
        builder: (context, state) {
          if (state is GenreShowsSuccess) {
            controller = ScrollController();
            return ScrollSnapList(
              padding: const EdgeInsets.all(0),
              scrollPhysics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ItemDetails(
                        showModel: state.showList[index],
                      ),
                    ),
                  );
                },
                child: Stack(fit: StackFit.values.last, children: [
                  ListItem(
                    showModel: state.showList[index],
                  ),
                  Positioned(
                      left: 20.w,
                      top: 240.h,
                      child: SizedBox(
                        width: 160.w,
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text(
                            state.showList[index].originalTitleText!.text!,
                            style: Styles.textStyleBold24.copyWith(
                              color: Colors.white,
                              backgroundColor: Colors.grey.withOpacity(0.7),
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      )),
                ]),
              ),
              itemSize: 200.w,
              dynamicItemSize: true,
              itemCount: state.showList.length,
              listController: controller,
              onItemFocus: (_) {},
              onReachEnd: () {
                periodicTimer.cancel();
              },
            );
          } else if (state is GenreShowsFailure) {
            return CustomErrorWidget(errMessage: state.errMessage);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
