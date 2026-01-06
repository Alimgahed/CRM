
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}

class LayoutChanged extends LayoutState {
  final int index;

  LayoutChanged(this.index);
}
