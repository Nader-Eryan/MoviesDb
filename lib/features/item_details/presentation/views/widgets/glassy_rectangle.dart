import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/utils/styles.dart';

class GlassyRectangle extends StatelessWidget {
  const GlassyRectangle({super.key, required this.word});
  final String word;
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
        child: Container(
          width: 70.w,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade200.withOpacity(0.1),
          ),
          child: Center(
            child: Text(
              word,
              style: Styles.textStyleBold14,
            ),
          ),
        ),
      ),
    );
  }
}
