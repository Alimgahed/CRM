import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/actions/data/model/lead_action_model.dart';
import 'package:crm/features/actions/data/repo/add_action_repo.dart';
import 'package:crm/features/actions/logic/state/add_action_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddActionCubit extends Cubit<AddActionState> {
  final AddActionRepo addActionRepo;

  AddActionCubit({required this.addActionRepo})
    : super(const AddActionState.initial());
  final formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  int? actionType;
  DateTime? date;
  void setActionType(int value) {
    actionType = value;
    emit(AddActionState.actionTypeChanged(value));
  }

  Future<void> saveAction(LeadActionModel action) async {
    emit(AddActionState.loading());

    final result = await addActionRepo.addAgentAction(action);

    result.when(
      success: (data) {
        emit(AddActionState.loaded(data));
        reset();
      },
      error: (e) {
        emit(AddActionState.error(e.error ?? 'Something went wrong'));
      },
    );
  }

  void reset() {
    formKey.currentState?.reset();
    dateController.clear();

    actionType = null;
    emit(const AddActionState.initial());
  }

  @override
  Future<void> close() {
    dateController.dispose();
    return super.close();
  }
}
