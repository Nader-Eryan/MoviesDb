import 'package:flutter/material.dart';
import 'package:whats_for_tonight/core/widgets/separated_list.dart';

import '../../../../core/utils/functions/custom_arrow_back_app_bar.dart';

class BookmarksView extends StatelessWidget {
  const BookmarksView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customArrowBackAppBar(context),
        body: const Placeholder(),
        // body: const SeparatedList(),
      ),
    );
  }
}
