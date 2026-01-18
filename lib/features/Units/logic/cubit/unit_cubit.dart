import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/Units/logic/state/units_state.dart';
import 'package:crm/features/Units/data/repos/units.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitCubit extends Cubit<UnitsState> {
  final UnitsRepo unitsRepo;

  UnitCubit({required this.unitsRepo}) : super(const UnitsState.initial());

  Future<void> getUnits() async {
    emit(const UnitsState.loading());

    final result = await unitsRepo.getUnits();

    result.when(
      success: (data) => emit(UnitsState.loaded(data.data)),
      error: (e) => emit(UnitsState.error(e.error ?? 'Unknown error')),
    );
  }
}
