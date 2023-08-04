import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whats_for_tonight/core/utils/constants.dart';
import 'package:whats_for_tonight/features/home/presentation/manager/cubit/brightness_cubit.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              size: 32,
            ),
            label: 'Home'),
        NavigationDestination(
            icon: Icon(FontAwesomeIcons.magnifyingGlass), label: 'Search'),
        NavigationDestination(
            icon: Icon(FontAwesomeIcons.heart), label: 'Favorites'),
        NavigationDestination(
            icon: Icon(FontAwesomeIcons.user), label: 'Profile'),
      ],
      selectedIndex: currentPageIndex,
      onDestinationSelected: (int index) {
        currentPageIndex = index;
        setState(() {});
      },
      backgroundColor: BlocProvider.of<BrightnessCubit>(context).isDark
          ? kPrimaryDarkTheme
          : kPrimaryLightTheme,
    );
  }
}
