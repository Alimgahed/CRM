import 'package:crm/features/home/logic/cubit/layout_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  int currentIndex = 0;

  final List<Widget> screens = [];

  void setScreens(List<Widget> pages) {
    screens.clear();
    screens.addAll(pages);
  }

  void change(int index) {
    currentIndex = index;
    emit(LayoutChanged(index));
  }
}
