import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/utils/styles.dart';
import 'package:whats_for_tonight/features/item_details/presentation/views/widgets/stack_section.dart';

class ItemDetailsBody extends StatelessWidget {
  const ItemDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 500.h,
          child: const StackSection(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            children: [
              Container(
                height: 40.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'IMDB 8.4/',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        '10',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border_outlined)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.share_outlined)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.bookmark_outline)),
            ],
          ),
        ),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text('Joker', style: Styles.textStyleBold28)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
              'storyline storyline storyline storyline storyline storyline storyline storyline storyline storyline storyline storyline storyline storyline storyline storyline storyline storyline',
              style: TextStyle(color: Colors.grey.shade600, height: 2)),
        ),
      ]),
    );
  }
}
