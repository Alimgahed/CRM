import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/Projects/data/repo/projects_repo.dart';
import 'package:crm/features/Projects/logic/cubit/project_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectCubit extends Cubit<ProjectsState> {
  final ProjectsRepo projectsRepo;

  ProjectCubit({required this.projectsRepo})
    : super(const ProjectsState.initial());

  Future<void> fetchAllProjects() async {
    emit(const ProjectsState.loading());

    final result = await projectsRepo.getAllProjects();

    result.when(
      success: (data) => emit(ProjectsState.loaded(data.data)),
      error: (error) =>
          emit(ProjectsState.error(error.error ?? "Unknown Error")),
    );
  }
}
