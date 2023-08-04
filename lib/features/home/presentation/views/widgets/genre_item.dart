import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/loading_widget.dart';

class GenreItem extends StatelessWidget {
  const GenreItem({super.key, this.width});
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 200.w,
      child: AspectRatio(
        aspectRatio: 2.4 / 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: CachedNetworkImage(
              progressIndicatorBuilder: (context, url, progress) =>
                  const CustomLoadingWidget(),
              errorWidget: (context, url, error) =>
                  const CustomErrorWidget(errMessage: 'Image not found!'),
              fit: BoxFit.fill,
              imageUrl:
                  'https://media.istockphoto.com/id/1265114180/photo/hiking-at-the-wave-in-arizona.webp?b=1&s=612x612&w=0&k=20&c=0f5I155dHmM_Y3K3NvbncstHMrdEEc-a_1HIcDuZeAQ='),
        ),
      ),
    );
  }
}
