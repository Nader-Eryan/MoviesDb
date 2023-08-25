// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:size_config/size_config.dart';

import 'package:whats_for_tonight/features/favorites/data/repos/favorites_repo.dart';
import 'package:whats_for_tonight/features/home/data/models/show/show.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/list_item.dart';
import '../../../../generated/l10n.dart';
import '../../../item_details/presentation/views/item_details.dart';
import '../manager/cubit/favorite_shows_cubit.dart';

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
  List<Show> showList = [];
  String? uid;
  @override
  void initState() {
    uid = FirebaseAuth.instance.currentUser?.uid;
    getShowsId();
    super.initState();
  }

  void getShowsId() async {
    if (uid != null) {
      showsId = await widget.favoritesRepo.getShowsId(uid: uid!);
    }
    getShowList();
  }

  void getShowList() {
    for (var id in showsId) {
      if (mounted) {
        BlocProvider.of<FavoriteShowsCubit>(context).fetchShow(id: id);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteShowsCubit, FavoriteShowsState>(
      listener: (context, state) {
        if (state is FavoriteShowsSuccess) {
          showList.add(state.show);
        }
      },
      builder: (context, state) {
        if (state is FavoriteShowsSuccess) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ItemDetails(
                        showModel: showList[index],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: ListItem(
                        showModel: showList[index],
                        width: 100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SizedBox(
                        width: 200.w,
                        height: 110.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              showList[index].originalTitleText!.text!,
                              style: Styles.textStyleBold20,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            Text(
                              showList[index].releaseYear == null
                                  ? ''
                                  : showList[index]
                                      .releaseYear!
                                      .year!
                                      .toString(),
                              style: Styles.textStyleBold16
                                  .copyWith(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              showList[index].primaryImage == null
                                  ? ''
                                  : showList[index]
                                      .primaryImage!
                                      .caption!
                                      .plainText!,
                              style: Styles.textStyleMedium16
                                  .copyWith(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              );
            },
            itemCount: showList.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              thickness: 2,
            ),
          );
        } else {
          return Center(
            child: Text(
              S.of(context).AddSomeFavorites,
              style: Styles.textStyleBold20,
            ),
          );
        }
      },
    );
  }
}
