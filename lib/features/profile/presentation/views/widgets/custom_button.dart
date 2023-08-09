import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../core/utils/styles.dart';

ElevatedButton customButton(GlobalKey<FormBuilderState> formKey, Color color,
    String txt, VoidCallback onPressed,
    {String? imgUrl}) {
  return ElevatedButton(
    style: ButtonStyle(
      side: MaterialStateProperty.all(BorderSide(color: color)),
      backgroundColor: MaterialStateProperty.all(color),
      minimumSize: MaterialStateProperty.all(const Size(260, 56)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    onPressed: onPressed,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        imgUrl != null
            ? Image.asset(
                imgUrl,
                height: 30,
              )
            : const Text(''),
        Text(
          '   $txt',
          style: Styles.textStyleBold18,
        ),
      ],
    ),
  );
}
