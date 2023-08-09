import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import '../../widgets/back_arrow_icon.dart';

AppBar customArrowBackAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 90.h,
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BackArrowIcon(onPressed: () {
          Navigator.pop(context);
        }),
      ],
    ),
  );
}
