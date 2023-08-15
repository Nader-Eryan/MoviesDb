import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/widgets/custom_error_widget.dart';
import 'package:whats_for_tonight/core/widgets/loading_widget.dart';
import 'package:whats_for_tonight/core/widgets/profile_pic.dart';
import 'package:whats_for_tonight/features/custom_button_navigation.dart/presentation/manager/cubit/page_index_cubit.dart';
import 'package:whats_for_tonight/features/home/presentation/manager/genre_names_cubit/genre_names_cubit.dart';

import '../../manager/brightness_cubit/brightness_cubit.dart';
import '../constants.dart';
import '../styles.dart';

AppBar? customAppBar(
    BuildContext ctx, List<String> genreNames, TabController tabController) {
  bool isDark = BlocProvider.of<BrightnessCubit>(ctx, listen: true).isDark;
  return BlocProvider.of<PageIndexCubit>(ctx).currentPageIndex == 0
      ? AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light
              .copyWith(statusBarColor: kPrimaryDarkTheme),
          toolbarHeight: 90.h,
          elevation: 0,
          title: Row(
            children: [
              ClipRRect(
                child: Image.asset('assets/images/logo.png',
                    width: 120.0.w, fit: BoxFit.contain),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: Expanded(
              child: BlocBuilder<GenreNamesCubit, GenreNamesState>(
                builder: (context, state) {
                  if (state is GenreNamesSuccess) {
                    return TabBar(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      unselectedLabelColor:
                          isDark ? Colors.white : Colors.black,
                      indicatorColor: kActiveIcon,
                      labelStyle: Styles.textStyleBold18
                          .copyWith(fontWeight: FontWeight.w500),
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      controller: tabController,
                      tabs: List.generate(genreNames.length,
                          (index) => Text(genreNames[index])),
                    );
                  } else if (state is GenreNamesFailure) {
                    return CustomErrorWidget(errMessage: state.errMessage);
                  } else {
                    return const CustomLoadingWidget();
                  }
                },
              ),
            ),
          ),
          actions: const [
            ProfilePic(),
            SizedBox(
              width: 16,
            )
          ],
        )
      : null;
}
