import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/manager/brightness_cubit/brightness_cubit.dart';
import '../../../../../core/utils/constants.dart';

OutlineInputBorder enabledBorder(BuildContext context) {
  bool isDark = BlocProvider.of<BrightnessCubit>(context).isDark;
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide:
          BorderSide(color: isDark ? kPrimaryDarkTheme : kPrimaryLightTheme));
}

OutlineInputBorder focusBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: kActiveIcon));
}
