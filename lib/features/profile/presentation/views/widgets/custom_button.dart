import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

ElevatedButton customButton(Color color, String txt, VoidCallback onPressed,
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
        Expanded(
          child: Center(
            child: Text(
              '   $txt',
              style: Styles.textStyleBold20,
              maxLines: 1,
            ),
          ),
        ),
      ],
    ),
  );
}
