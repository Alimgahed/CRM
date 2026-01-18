import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/tasks/data/repo/task_repo.dart';
import 'package:crm/features/tasks/logic/state/task_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepo taskRepo;

  TaskCubit({required this.taskRepo}) : super(const TaskState.initial());

  Future<void> getAllTasks() async {
    emit(const TaskState.loading());

    final result = await taskRepo.getAllTasks();

    result.when(
      success: (data) => emit(TaskState.loaded(data)),
      error: (e) => emit(TaskState.error(e.error ?? 'Unknown error')),
    );
  }
}
