import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'brightness_state.dart';

class BrightnessCubit extends Cubit<BrightnessState> {
  bool isDark = false;
  BrightnessCubit() : super(BrightnessInitial());
  void switchBrightnessMode() {
    isDark = !isDark;
    if (isDark) {
      emit(BrightnessDark());
    } else {
      emit(BrightnessLight());
    }
  }
}
