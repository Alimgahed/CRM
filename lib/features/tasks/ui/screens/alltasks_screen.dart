import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/tasks/logic/cubit/task_cubit.dart';
import 'package:crm/features/tasks/logic/state/task_state.dart';
import 'package:crm/features/tasks/ui/widgets/all_task_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm/Core/widgets/gloable.dart';

import 'package:crm/features/Projects/ui/widgets/all_project_loadding.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Column(
        children: [
          ReusableHeader(title: appLocalizations.tasksMenu),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SearchBarWidget(
              prefixIcon: Icons.search,
              suffixIcon: Icons.filter_list,
              hintText: appLocalizations.search,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                return state.when(
                  initial: () => Center(
                    child: Text(
                      appLocalizations.noData,
                      style: TextStyle(
                        color: isDark ? Colors.white70 : darkColor,
                      ),
                    ),
                  ),
                  loading: () => ListView.builder(
                    itemCount: 5,
                    itemBuilder: (_, __) => const AllProjectShimmer(),
                  ),
                  loaded: (units) => units.data!.isEmpty
                      ? Center(
                          child: Text(
                            appLocalizations.noData,
                            style: TextStyle(
                              color: isDark ? Colors.white70 : darkColor,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: units.data!.length,
                          itemBuilder: (_, index) {
                            return TaskWidget(task: units.data![index]);
                          },
                        ),
                  error: (message) => Center(
                    child: Text(
                      message,
                      style: TextStyle(
                        color: isDark ? Colors.red[300] : Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
