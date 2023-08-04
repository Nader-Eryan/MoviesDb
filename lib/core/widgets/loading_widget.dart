import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:size_config/size_config.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key, this.width});
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Center(
        child: SizedBox(
          width: width ?? 200.w,
          child: AspectRatio(
            aspectRatio: 2.3 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                color: Colors.amber,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
