import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/features/Projects/logic/cubit/project_cubit.dart';
import 'package:crm/features/Projects/logic/cubit/project_states.dart';
import 'package:crm/features/Projects/ui/widgets/allProject.dart';
import 'package:crm/features/Projects/ui/widgets/all_project_loadding.dart';

class Allprojects extends StatelessWidget {
  const Allprojects({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations(
      context.watch<LocaleCubit>().currentLocale,
    );

    return Scaffold(
      body: Column(
        children: [
          ReusableHeader(
            title: appLocalizations.projects,
          ), // Using localized text
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SearchBarWidget(
              prefixIcon: Icons.search,
              suffixIcon: Icons.filter_list,
              hintText: appLocalizations.search, // Localized hint text
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<ProjectCubit, ProjectsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => Center(
                    child: Text(appLocalizations.noData),
                  ), // Localized "No Data"
                  loading: () => ListView.builder(
                    itemCount: 5,
                    itemBuilder: (_, __) => const AllProjectShimmer(),
                  ),
                  loaded: (projects) => ListView.builder(
                    itemCount: projects.length,
                    itemBuilder: (_, index) {
                      return AllprojectWidget(project: projects[index]);
                    },
                  ),
                  error: (message) => Center(child: Text(message)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
