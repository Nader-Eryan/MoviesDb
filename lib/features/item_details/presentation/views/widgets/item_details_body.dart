import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/features/item_details/presentation/views/widgets/glassy_rectangle.dart';

import '../../../../../core/widgets/back_arrow_icon.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/profile_pic.dart';

class ItemDetailsBody extends StatelessWidget {
  const ItemDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          SizedBox(
            height: 500.h,
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, progress) =>
                        const CustomLoadingWidget(),
                    errorWidget: (context, url, error) =>
                        const CustomErrorWidget(errMessage: 'Image not found!'),
                    fit: BoxFit.fill,
                    imageUrl:
                        'https://media.istockphoto.com/id/1265114180/photo/hiking-at-the-wave-in-arizona.webp?b=1&s=612x612&w=0&k=20&c=0f5I155dHmM_Y3K3NvbncstHMrdEEc-a_1HIcDuZeAQ='),
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
                          child: const Center(child: Text('HD')),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 200.w,
                          height: 50.h,
                          child: ListView.builder(
                              reverse: true,
                              itemCount: 2,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    GlassyRectangle(word: 'Crime'),
                                    SizedBox(
                                      width: 12,
                                    )
                                  ],
                                );
                              })),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    ]);
  }
}
