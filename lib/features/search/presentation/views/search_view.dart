import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/utils/constants.dart';
import 'package:whats_for_tonight/core/utils/styles.dart';
import 'package:whats_for_tonight/features/home/presentation/views/widgets/genre_item.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80.h,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                prefixIcon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: kActiveIcon,
                ),
                iconColor: kActiveIcon,
                filled: true,
                focusColor: Colors.amberAccent,
                enabledBorder: searchFieldBorder(),
                focusedBorder: searchFieldBorder()),
          ),
        ),
        Expanded(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: GenreItem(
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
                            const Text(
                              'Don\'t Look Up',
                              style: Styles.textStyleBold20,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            Text(
                              '2021',
                              style: Styles.textStyleBold16
                                  .copyWith(color: Colors.grey),
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
                );
              },
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                thickness: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder searchFieldBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade600),
      borderRadius: BorderRadius.circular(24),
    );
  }
}


// Row(
//                 children: [
//                   GenreItem(
//                     width: 100,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   Expanded(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Title',
//                           style: Styles.textStyleBold24,
//                         ),
//                         Text('subtitle'),
//                         SizedBox(
//                           height: 80.h,
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
