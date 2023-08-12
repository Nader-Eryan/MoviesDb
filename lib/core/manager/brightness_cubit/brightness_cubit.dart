import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'brightness_state.dart';

class BrightnessCubit extends Cubit<BrightnessState> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isDark = true;
  bool get isDark => _isDark;
  Future<void> sharedPrefsBrightnessInit() async {
    final SharedPreferences prefs = await _prefs;
    _isDark = prefs.getBool('isDark') ?? true;
    if (_isDark) {
      emit(BrightnessChange());
    } else {
      emit(BrightnessChange());
    }
  }

  BrightnessCubit() : super(BrightnessInitial());
  void switchBrightnessMode(String? val) async {
    if (val == null) {
      _isDark = !_isDark;
    } else {
      if (val == 'light') {
        _isDark = false;
      } else {
        _isDark = true;
      }
    }
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('isDark', isDark);
    if (isDark) {
      emit(BrightnessChange());
    } else {
      emit(BrightnessChange());
    }
  }
}
