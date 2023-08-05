import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whats_for_tonight/core/utils/constants.dart';
import 'package:whats_for_tonight/features/custom_button_navigation.dart/presentation/manager/cubit/page_index_cubit.dart';
import 'package:whats_for_tonight/features/home/presentation/manager/cubit/brightness_cubit.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageIndexCubit, PageIndexState>(
      builder: (context, state) {
        return NavigationBar(
          destinations: const [
            NavigationDestination(
                selectedIcon: Icon(
                  Icons.home_outlined,
                  color: kActiveIcon,
                  size: 32,
                ),
                icon: Icon(
                  Icons.home_outlined,
                  size: 32,
                ),
                label: 'Home'),
            NavigationDestination(
              selectedIcon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: kActiveIcon,
              ),
              icon: Icon(FontAwesomeIcons.magnifyingGlass),
              label: 'Search',
            ),
            NavigationDestination(
                selectedIcon: Icon(
                  FontAwesomeIcons.heart,
                  color: kActiveIcon,
                ),
                icon: Icon(FontAwesomeIcons.heart),
                label: 'Favorites'),
            NavigationDestination(
                selectedIcon: Icon(
                  FontAwesomeIcons.user,
                  color: kActiveIcon,
                ),
                icon: Icon(FontAwesomeIcons.user),
                label: 'Profile'),
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
