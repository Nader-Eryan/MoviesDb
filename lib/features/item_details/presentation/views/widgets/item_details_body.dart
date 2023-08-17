// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import 'package:whats_for_tonight/core/utils/styles.dart';
import 'package:whats_for_tonight/features/home/data/models/show/show.dart';
import 'package:whats_for_tonight/features/item_details/presentation/views/widgets/stack_section.dart';
import 'package:whats_for_tonight/generated/l10n.dart';

class ItemDetailsBody extends StatefulWidget {
  const ItemDetailsBody({
    Key? key,
    required this.showModel,
  }) : super(key: key);
  final Show showModel;

  @override
  State<ItemDetailsBody> createState() => _ItemDetailsBodyState();
}

class _ItemDetailsBodyState extends State<ItemDetailsBody> {
  bool favColor = false;
  bool bkColor = false;
  bool loggedIn = false;
  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        loggedIn = false;
      } else {
        loggedIn = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 500.h,
          child: StackSection(
            showModel: widget.showModel,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            children: [
              Container(
                height: 40.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'IMDB NA/',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        '10',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  if (!loggedIn) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      S.of(context).SignInFirst,
                      style: Styles.textStyleMedium16,
                    )));
                  } else {
                    favColor = !favColor;
                    setState(() {});
                  }
                },
                icon: favColor == false
                    ? const Icon(Icons.favorite_border_outlined)
                    : const Icon(
                        Icons.favorite,
                        color: Colors.amber,
                      ),
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.share_outlined)),
              IconButton(
                  onPressed: () {
                    if (!loggedIn) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        S.of(context).SignInFirst,
                        style: Styles.textStyleMedium16,
                      )));
                    } else {
                      bkColor = !bkColor;
                      setState(() {});
                    }
                  },
                  icon: bkColor == false
                      ? const Icon(Icons.bookmark_outline)
                      : const Icon(
                          Icons.bookmark,
                          color: Colors.red,
                        )),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(widget.showModel.originalTitleText!.text!,
                style: Styles.textStyleBold28)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
              widget.showModel.primaryImage == null
                  ? S.of(context).NoInfoAboutShow
                  : widget.showModel.primaryImage!.caption!.plainText!,
              style: TextStyle(
                  color: Colors.grey.shade500, height: 2, fontSize: 18)),
        ),
      ]),
    );
  }
}
