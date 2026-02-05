import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/clients/data/model/leads_model.dart';
import 'package:crm/features/clients/data/repo/all_clients.dart';
import 'package:crm/features/clients/logic/states/leads_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeadsCubit extends Cubit<LeadsState> {
  final LeadsRepo projectsRepo;

  List<Lead> _allLeads = [];

  LeadsCubit({required this.projectsRepo}) : super(const LeadsState.initial());

  Future<void> fetchAllLeads() async {
    emit(const LeadsState.loading());

    final result = await projectsRepo.getAllLeads();

    result.when(
      success: (data) {
        _allLeads = data.data;
        emit(LeadsState.loaded(_allLeads));
      },
      error: (error) => emit(LeadsState.error(error.error ?? "Unknown Error")),
    );
  }

  /// 🔥 THIS IS WHAT FILTERS THE LIST
  void filterByStatus(int status) {
    // 0 = all clients
    if (status == 0) {
      emit(LeadsState.loaded(_allLeads));
      return;
    }

    final filtered = _allLeads.where((lead) => lead.status == status).toList();

    emit(LeadsState.loaded(filtered));
  }
}
