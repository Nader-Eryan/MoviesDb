import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import '../utils/styles.dart';

class SeparatedList extends StatelessWidget {
  const SeparatedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) =>  ItemDetails(showModel: ,)));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: Row(children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              //   child: ListItem(
              //     width: 100,
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: 200.w,
                  height: 110.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Don\'t Look Up',
                        style: Styles.textStyleBold20,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        '2021',
                        style:
                            Styles.textStyleBold16.copyWith(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Leonardo DiCaprio, Jennifer Lawerence',
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
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 2,
      ),
    );
  }
}
