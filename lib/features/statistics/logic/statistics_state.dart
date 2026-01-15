import 'package:crm/features/statistics/data/model/statistics_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics_state.freezed.dart';

@freezed
class StatisticsState with _$StatisticsState {
  const factory StatisticsState.initial() = Initial;
  const factory StatisticsState.loading() = Loading;
  const factory StatisticsState.loaded(AgentActionStatisticsResponse data) =
      Loaded;
  const factory StatisticsState.error(String message) = Error;
}
