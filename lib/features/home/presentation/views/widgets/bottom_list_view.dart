import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/utils/styles.dart';
import 'package:whats_for_tonight/core/widgets/custom_error_widget.dart';
import 'package:whats_for_tonight/features/home/presentation/manager/suggestion_shows_cubit/suggestion_shows_cubit.dart';

import '../../../../item_details/presentation/views/item_details.dart';
import '../../../../../core/widgets/list_item.dart';

class BottomListView extends StatelessWidget {
  const BottomListView({super.key, required this.bottomScrollController});

  final ScrollController bottomScrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuggestionShowsCubit, SuggestionShowsState>(
      builder: (context, state) {
        if (state is SuggestionShowsSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.showList.length,
                  controller: bottomScrollController,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ItemDetails(
                                showModel: state.showList[index],
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: ListItem(
                                showModel: state.showList[index],
                                width: 140.w,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                    bottomLeft: Radius.zero),
                                isCached: true,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8))),
                              child: SizedBox(
                                width: 140.w,
                                height: 25.h,
                                child: Center(
                                  child: Text(
                                    state.showList[index].originalTitleText!
                                        .text!,
                                    style: Styles.textStyleBold16
                                        .copyWith(color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          );
        } else if (state is SuggestionShowsFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
