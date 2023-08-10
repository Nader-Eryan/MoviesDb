import 'package:flutter/material.dart';
import 'package:whats_for_tonight/core/widgets/separated_list.dart';

class BookmarksView extends StatelessWidget {
  const BookmarksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SeparatedList(),
      ),
    );
  }
}
