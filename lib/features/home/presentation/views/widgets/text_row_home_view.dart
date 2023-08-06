import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import '../../../../../core/utils/styles.dart';

class TextRowHomeView extends StatelessWidget {
  const TextRowHomeView({super.key, required this.bottomScrollController});
  final ScrollController bottomScrollController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'We recommend',
          style: Styles.textStyleBold18,
        ),
        const Spacer(),
        Container(
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: Colors.grey.shade600),
          ),
          child: IconButton(
            onPressed: () {
              if (bottomScrollController.hasClients) {
                bottomScrollController.animateTo(
                    bottomScrollController.offset - 158.w,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.decelerate);
              }
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 14,
            ),
          ),
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: Colors.grey.shade600),
          ),
          child: IconButton(
            onPressed: () {
              if (bottomScrollController.hasClients) {
                bottomScrollController.animateTo(
                    bottomScrollController.offset + 158.w,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.decelerate);
              }
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
          ),
        ),
      ],
    );
  }
}
