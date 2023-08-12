import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whats_for_tonight/core/utils/constants.dart';
import 'package:whats_for_tonight/features/custom_button_navigation.dart/presentation/manager/cubit/page_index_cubit.dart';

import '../../../../../core/manager/brightness_cubit/brightness_cubit.dart';
import '../../../../../generated/l10n.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageIndexCubit, PageIndexState>(
      builder: (context, state) {
        return NavigationBar(
          destinations: [
            NavigationDestination(
                selectedIcon: const Icon(
                  Icons.home_outlined,
                  color: kActiveIcon,
                  size: 32,
                ),
                icon: const Icon(
                  Icons.home_outlined,
                  size: 32,
                ),
                label: S.of(context).Home),
            NavigationDestination(
              selectedIcon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: kActiveIcon,
              ),
              icon: const Icon(FontAwesomeIcons.magnifyingGlass),
              label: S.of(context).Search,
            ),
            NavigationDestination(
                selectedIcon: const Icon(
                  FontAwesomeIcons.heart,
                  color: kActiveIcon,
                ),
                icon: const Icon(FontAwesomeIcons.heart),
                label: S.of(context).Favorites),
            NavigationDestination(
                selectedIcon: const Icon(
                  FontAwesomeIcons.user,
                  color: kActiveIcon,
                ),
                icon: const Icon(FontAwesomeIcons.user),
                label: S.of(context).Profile),
          ],
          selectedIndex:
              BlocProvider.of<PageIndexCubit>(context).currentPageIndex,
          onDestinationSelected: (int index) {
            BlocProvider.of<PageIndexCubit>(context).changePageIndex(index);
          },
          backgroundColor:
              BlocProvider.of<BrightnessCubit>(context, listen: true).isDark
                  ? const Color.fromARGB(31, 218, 214, 214)
                  : const Color.fromARGB(255, 238, 232, 232),
        );
      },
    );
  }
}
