import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'custom_error_widget.dart';
import 'loading_widget.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          CachedNetworkImage(
              progressIndicatorBuilder: (context, url, progress) =>
                  const CustomLoadingWidget(),
              errorWidget: (context, url, error) =>
                  const CustomErrorWidget(errMessage: 'Image not found!'),
              fit: BoxFit.fill,
              imageUrl:
                  'https://media.istockphoto.com/id/1265114180/photo/hiking-at-the-wave-in-arizona.webp?b=1&s=612x612&w=0&k=20&c=0f5I155dHmM_Y3K3NvbncstHMrdEEc-a_1HIcDuZeAQ='),
        ],
      )
    ]);
  }
}
