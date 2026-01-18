import 'package:crm/features/tasks/data/model/task_respone.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_state.freezed.dart';

@freezed
class TaskState with _$TaskState {
  const factory TaskState.initial() = Initial;
  const factory TaskState.loading() = Loading;
  const factory TaskState.loaded(TaskRespone data) = Loaded;
  const factory TaskState.error(String message) = Error;
}
