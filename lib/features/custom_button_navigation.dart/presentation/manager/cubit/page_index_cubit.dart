import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'page_index_state.dart';

class PageIndexCubit extends Cubit<PageIndexState> {
  PageIndexCubit() : super(PageIndexInitial());
  int currentPageIndex = 0;
  void changePageIndex(index) {
    currentPageIndex = index;
    emit(PageIndexUpdate());
  }
}
