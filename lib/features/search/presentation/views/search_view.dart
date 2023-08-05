import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/utils/constants.dart';

import '../../../../core/widgets/separated_list.dart';

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
            child: const SeparatedList(),
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
