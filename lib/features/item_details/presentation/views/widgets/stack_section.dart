// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import 'package:whats_for_tonight/features/home/data/models/show/show.dart';

import '../../../../../core/widgets/back_arrow_icon.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/profile_pic.dart';
import 'glassy_rectangle.dart';

class StackSection extends StatelessWidget {
  const StackSection({
    Key? key,
    required this.showModel,
  }) : super(key: key);
  final Show showModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        CachedNetworkImage(
            width: 360.w,
            progressIndicatorBuilder: (context, url, progress) =>
                const CustomLoadingWidget(),
            errorWidget: (context, url, error) =>
                const CustomErrorWidget(errMessage: 'Image not found!'),
            fit: BoxFit.fill,
            imageUrl: showModel.primaryImage == null
                ? 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png?20210219185637'
                : showModel.primaryImage!.url!),
        Positioned(
          left: 12,
          top: 28,
          child: BackArrowIcon(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        const Positioned(
          top: 28,
          right: 12,
          child: ProfilePic(),
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: 360.w,
            height: 100.h,
            child: Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  height: 50.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text(
                      'HD',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 200.w,
                  height: 50.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GlassyRectangle(
                          word: showModel.releaseYear!.year!.toString()),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
