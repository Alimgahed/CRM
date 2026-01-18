import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_task_state.freezed.dart';

@freezed
class AddTaskState with _$AddTaskState {
  const factory AddTaskState.initial() = AddTaskInitial;
  const factory AddTaskState.loading() = AddTaskLoading;
  const factory AddTaskState.loaded(String message) = AddTaskLoaded;
  const factory AddTaskState.error(String message) = AddTaskError;
}
