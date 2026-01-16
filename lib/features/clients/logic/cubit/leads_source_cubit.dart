import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/clients/data/repo/lead_soure.dart';
import 'package:crm/features/clients/logic/states/leads_source_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeadsSourceCubit extends Cubit<LeadsSourceState> {
  final LeadSourceRepo leadSourceRepo;

  LeadsSourceCubit({required this.leadSourceRepo})
    : super(const LeadsSourceState.initial());

  Future<void> fetchAllLeads() async {
    emit(const LeadsSourceState.loading());

    final result = await leadSourceRepo.getAllLeadsSource();

    result.when(
      success: (data) => emit(LeadsSourceState.loaded(data)),
      error: (error) =>
          emit(LeadsSourceState.error(error.error ?? "Unknown Error")),
    );
  }
}
