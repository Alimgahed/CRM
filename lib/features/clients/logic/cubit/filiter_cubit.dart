import 'package:flutter_bloc/flutter_bloc.dart';

class FiliterCubit extends Cubit<int> {
  FiliterCubit() : super(200);

  void change(int index) => emit(index);
}
