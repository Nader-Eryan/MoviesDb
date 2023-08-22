// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:whats_for_tonight/core/utils/service_locator.dart';
import 'package:whats_for_tonight/features/favorites/data/repos/favorites_repo.dart';
import 'package:whats_for_tonight/features/favorites/data/repos/favorites_repo_impl.dart';

import 'package:whats_for_tonight/features/home/data/models/show/show.dart';
import 'package:whats_for_tonight/features/item_details/presentation/views/widgets/item_details_body.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({
    Key? key,
    required this.showModel,
  }) : super(key: key);
  final Show showModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ItemDetailsBody(
          showModel: showModel,
          favoritesRepo: getIt.get<FavoritesRepoImpl>(),
        ),
      ),
    );
  }
}
