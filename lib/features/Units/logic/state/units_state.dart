import 'package:crm/features/Units/data/models/unit_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'units_state.freezed.dart';

@freezed
class UnitsState with _$UnitsState {
  const factory UnitsState.initial() = UnitsInitial;
  const factory UnitsState.loading() = UnitsLoading;
  const factory UnitsState.loaded(List<Unit> data) = UnitsLoaded;
  const factory UnitsState.error(String message) = UnitsError;
}
