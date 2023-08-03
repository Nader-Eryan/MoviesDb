import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class TextRowHomeView extends StatelessWidget {
  const TextRowHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'We recommend',
          style: Styles.textStyleBold16,
        ),
        const Spacer(),
        Container(
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: Colors.grey.shade600),
          ),
          child: IconButton(
            onPressed: () {},
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
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        )
      ],
    );
  }
}
