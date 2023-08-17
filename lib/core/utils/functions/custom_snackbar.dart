import 'package:flutter/material.dart';
import 'package:whats_for_tonight/core/utils/styles.dart';

customSnackBar(BuildContext context, msg) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: Styles.textStyleMedium16,
      ),
    ),
  );
}
