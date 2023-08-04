import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whats_for_tonight/features/custom_button_navigation.dart/presentation/manager/cubit/page_index_cubit.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageIndexCubit, PageIndexState>(
      builder: (context, state) {
        return NavigationBar(
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  size: 32,
                ),
                label: 'Home'),
            NavigationDestination(
              icon: Icon(FontAwesomeIcons.magnifyingGlass),
              label: 'Search',
            ),
            NavigationDestination(
                icon: Icon(FontAwesomeIcons.heart), label: 'Favorites'),
            NavigationDestination(
                icon: Icon(FontAwesomeIcons.user), label: 'Profile'),
          ],
          selectedIndex:
              BlocProvider.of<PageIndexCubit>(context).currentPageIndex,
          onDestinationSelected: (int index) {
            BlocProvider.of<PageIndexCubit>(context).changePageIndex(index);
          },
          // backgroundColor: BlocProvider.of<BrightnessCubit>(context).isDark
          //     ? kPrimaryDarkTheme
          //     : kPrimaryLightTheme,
        );
      },
    );
  }
}
