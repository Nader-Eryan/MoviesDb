// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import 'custom_error_widget.dart';
import 'loading_widget.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    this.width,
    this.borderRadius,
  }) : super(key: key);
  final double? width;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 200.w,
      child: AspectRatio(
        aspectRatio: 2.4 / 3,
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(24),
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
