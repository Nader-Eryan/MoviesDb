// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:size_config/size_config.dart';

import '../../features/home/data/models/show/show.dart';
import 'custom_error_widget.dart';
import 'loading_widget.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    this.width,
    this.borderRadius,
    required this.showModel,
  }) : super(key: key);
  final double? width;
  final BorderRadius? borderRadius;
  final Show showModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 200.w,
      child: AspectRatio(
        aspectRatio: 2.4 / 3,
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(24),
          child: showModel.primaryImage != null
              ? CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, progress) =>
                      const CustomLoadingWidget(),
                  errorWidget: (context, url, error) =>
                      const CustomErrorWidget(errMessage: 'Image not found!'),
                  fit: BoxFit.fill,
                  imageUrl: showModel.primaryImage == null
                      ? 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png?20210219185637'
                      : showModel.primaryImage!.url!)
              : const Icon(FontAwesomeIcons.exclamation),
        ),
      ),
    );
  }
}
