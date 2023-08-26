import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

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
    child: SizedBox(
      width: 300.w,
      height: 40.h,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imgUrl != null
                ? Image.asset(
                    imgUrl,
                    height: 30,
                  )
                : const Text(''),
            Center(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  '   $txt',
                  style: Styles.textStyleBold28,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
