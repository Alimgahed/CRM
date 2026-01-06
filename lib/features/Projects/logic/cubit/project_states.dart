import 'package:crm/features/Projects/data/model/project_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_states.freezed.dart';

@freezed
class ProjectsState with _$ProjectsState {
  const factory ProjectsState.initial() = ProjectsStateInitial;
  const factory ProjectsState.loading() = ProjectsStateLoading;
  const factory ProjectsState.loaded(List<Project> data) = ProjectsStateLoaded;
  const factory ProjectsState.error(String message) = ProjectsStateError;
}
