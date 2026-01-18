import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/actions/data/repo/lead_action.dart';
import 'package:crm/features/actions/logic/state/lead_action_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionCubit extends Cubit<LeadActionState> {
  final LeadActionRepo leadActionRepo;

  ActionCubit({required this.leadActionRepo})
    : super(const LeadActionState.initial());

  Future<void> getLeadActions({required String leadId}) async {
    emit(const LeadActionState.loading());

    final result = await leadActionRepo.getLeadActions(leadId);

    result.when(
      success: (data) => emit(LeadActionState.loaded(data.data!)),
      error: (e) => emit(LeadActionState.error(e.error ?? 'Unknown error')),
    );
  }
}
