import 'package:crm/Core/network/api_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm/features/tasks/data/model/task_model.dart';
import 'package:crm/features/tasks/data/repo/add_task_repo.dart';
import 'package:crm/features/tasks/logic/state/add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  final AddTaskRepo addTaskRepo;

  // Controllers
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final expirationDateController = TextEditingController();
  String? assignedToId;
  int? status;
  final formKey = GlobalKey<FormState>();

  AddTaskCubit({required this.addTaskRepo})
    : super(const AddTaskState.initial());

  Future<void> emitAddTask() async {
    if (formKey.currentState!.validate()) {
      emit(const AddTaskState.loading());

      final task = TaskModel(
        title: titleController.text,
        description: descriptionController.text,
        dueDate: DateTime.tryParse(expirationDateController.text),
        assignedToId: assignedToId, // Usually you'd use a user ID here
        status: status, // Initial status
      );

      final result = await addTaskRepo.addTask(task);

      result.when(
        success: (data) => emit(AddTaskState.loaded(data)),
        error: (e) => emit(AddTaskState.error(e.error ?? 'Unknown error')),
      );
    }
  }

  @override
  Future<void> close() {
    titleController.dispose();
    descriptionController.dispose();
    expirationDateController.dispose();
    assignedToId = null;
    status = null;
    return super.close();
  }
}
