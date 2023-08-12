import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isEnglish = true;
  bool get isEnglish => _isEnglish;
  Future<void> sharedPrefsLanguageInit() async {
    final SharedPreferences prefs = await _prefs;
    _isEnglish = prefs.getBool('isEnglish') ?? true;
    if (_isEnglish) {
      emit(LanguageChange());
    } else {
      emit(LanguageChange());
    }
  }

  void switchLanguage(String? val) async {
    if (val == null) {
      _isEnglish = !_isEnglish;
    } else {
      if (val == 'ar') {
        _isEnglish = false;
      } else {
        _isEnglish = true;
      }
    }
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('isEnglish', isEnglish);
    if (isEnglish) {
      emit(LanguageChange());
    } else {
      emit(LanguageChange());
    }
  }
}
