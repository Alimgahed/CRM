import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/clients/data/repo/all_clients.dart';
import 'package:crm/features/clients/logic/cubit/leads_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeadsCubit extends Cubit<LeadsState> {
  final LeadsRepo projectsRepo;

  LeadsCubit({required this.projectsRepo}) : super(const LeadsState.initial());

  Future<void> fetchAllLeads() async {
    emit(const LeadsState.loading());

    final result = await projectsRepo.getAllLeads();

    result.when(
      success: (data) => emit(LeadsState.loaded(data.data)),
      error: (error) => emit(LeadsState.error(error.error ?? "Unknown Error")),
    );
  }
}
