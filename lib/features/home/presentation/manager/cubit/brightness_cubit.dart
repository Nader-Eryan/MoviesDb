import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'brightness_state.dart';

class BrightnessCubit extends Cubit<BrightnessState> {
  bool _isDark = false;
  bool get isDark => _isDark;

  BrightnessCubit() : super(BrightnessInitial());
  void switchBrightnessMode() {
    _isDark = !_isDark;
    if (isDark) {
      emit(BrightnessChange());
    } else {
      emit(BrightnessChange());
    }
  }
}
