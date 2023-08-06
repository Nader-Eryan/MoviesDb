import 'package:flutter/material.dart';
import 'package:whats_for_tonight/features/item_details/presentation/views/widgets/item_details_body.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ItemDetailsBody(),
      ),
    );
  }
}
