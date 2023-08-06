import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/utils/styles.dart';

import '../../../../item_details/presentation/views/item_details.dart';
import '../../../../../core/widgets/list_item.dart';

class BottomListView extends StatelessWidget {
  const BottomListView({super.key, required this.bottomScrollController});

  final ScrollController bottomScrollController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            controller: bottomScrollController,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ItemDetails()));
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: ListItem(
                          width: 140.w,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                              bottomLeft: Radius.zero),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const SizedBox(
                        width: 140,
                        height: 20,
                        child: Text(
                          'Movie title Movie app',
                          style: Styles.textStyleBold16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        // const SizedBox(
        //   width: 140,
        //   child:
        //     child:
        // ),
      ],
    );
  }
}
