import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/statistics/data/repo/statistics_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  final StatisticsRepo repo;

  StatisticsCubit(this.repo) : super(const StatisticsState.initial());

  Future<void> getStatistics() async {
    emit(const StatisticsState.loading());

    final result = await repo.getAgentActionStatistics();

    result.when(
      success: (data) => emit(StatisticsState.loaded(data)),
      error: (e) => emit(StatisticsState.error(e.error ?? 'Unknown error')),
    );
  }
}
