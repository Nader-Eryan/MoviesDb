// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import 'package:whats_for_tonight/core/utils/styles.dart';
import 'package:whats_for_tonight/features/home/data/models/show/show.dart';
import 'package:whats_for_tonight/features/item_details/presentation/views/widgets/stack_section.dart';

class ItemDetailsBody extends StatelessWidget {
  const ItemDetailsBody({
    Key? key,
    required this.showModel,
  }) : super(key: key);
  final Show showModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 500.h,
          child: StackSection(
            showModel: showModel,
          ),
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
                        'IMDB NA/',
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
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(showModel.originalTitleText!.text!,
                style: Styles.textStyleBold28)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
              showModel.primaryImage == null
                  ? 'There is not much infromation about this show'
                  : showModel.primaryImage!.caption!.plainText!,
              style: TextStyle(
                  color: Colors.grey.shade500, height: 2, fontSize: 18)),
        ),
      ]),
    );
  }
}
