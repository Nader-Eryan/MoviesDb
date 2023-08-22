// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:whats_for_tonight/features/favorites/data/repos/favorites_repo.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({
    Key? key,
    required this.favoritesRepo,
  }) : super(key: key);
  final FavoritesRepo favoritesRepo;

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  List<String> showsId = [];
  @override
  void initState() {
    getShowsId();
    super.initState();
  }

  void getShowsId() async {
    showsId = await widget.favoritesRepo.getShowsId();
    print(showsId);
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Placeholder() //SeparatedList()
        );
  }
}
