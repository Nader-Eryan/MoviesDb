import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/widgets/list_item.dart';

import '../../features/home/data/models/show/show.dart';
import '../../features/item_details/presentation/views/item_details.dart';
import '../utils/styles.dart';

class SeparatedList extends StatelessWidget {
  const SeparatedList({super.key, required this.showList});
  final List<Show> showList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ItemDetails(
                  showModel: showList[index],
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListItem(
                  showModel: showList[index],
                  width: 100,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: 200.w,
                  height: 110.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        showList[index].originalTitleText!.text!,
                        style: Styles.textStyleBold20,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        showList[index].releaseYear == null
                            ? ''
                            : showList[index].releaseYear!.year!.toString(),
                        style:
                            Styles.textStyleBold16.copyWith(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        showList[index].primaryImage == null
                            ? ''
                            : showList[index].primaryImage!.caption!.plainText!,
                        style: Styles.textStyleMedium16
                            .copyWith(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        );
      },
      itemCount: showList.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 2,
      ),
    );
  }
}
