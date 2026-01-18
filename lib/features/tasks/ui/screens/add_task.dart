import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/fields.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/tasks/data/repo/add_task_repo.dart';
import 'package:crm/features/tasks/logic/cubit/add_task_cubit.dart';
import 'package:crm/features/tasks/logic/state/add_task_state.dart';
import 'package:crm/features/users/data/model/users_model.dart';
import 'package:crm/features/users/data/repo/user_repo.dart';
import 'package:crm/features/users/logic/cubit/users_cubit.dart';
import 'package:crm/features/users/logic/states/users_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AddTaskCubit(addTaskRepo: getIt.get<AddTaskRepo>()),
        ),
        BlocProvider(
          create: (context) =>
              UsersCubit(userRepo: getIt.get<UserRepo>())..getAllUsers(),
        ),
      ],
      child: BlocListener<AddTaskCubit, AddTaskState>(
        listener: (context, state) {
          state.whenOrNull(
            loaded: (task) {
              showAboutDialog(context: context, children: [Text("done")]);
            },
            error: (error) {
              showAboutDialog(context: context, children: [Text(error)]);
            },
          );
        },
        child: Builder(
          builder: (context) {
            final cubit = context.read<AddTaskCubit>();

            return SingleChildScrollView(
              child: Column(
                children: [
                  const FloatingCloseButton(),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDarkMode ? darkColor : Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: cubit.formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeader(isDarkMode),
                            const SizedBox(height: 16),
                            _buildDateRow(isDarkMode),
                            const SizedBox(height: 16),
                            CustomTextFormField(
                              labelText: 'Task Title',
                              controller: cubit.titleController,
                              validator: (val) =>
                                  val!.isEmpty ? 'Required' : null,
                            ),
                            const SizedBox(height: 10),

                            CustomDropdownFormField<int>(
                              text: 'Task Priority',
                              labelText: 'Select Priority',
                              items: const [
                                DropdownMenuItem(value: 1, child: Text('Low')),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text('Medium'),
                                ),
                                DropdownMenuItem(value: 3, child: Text('High')),
                                DropdownMenuItem(
                                  value: 4,
                                  child: Text('urgent'),
                                ),
                              ],
                              onChanged: (val) => cubit.status = val,
                            ),
                            const SizedBox(height: 10),

                            BlocBuilder<UsersCubit, UsersState>(
                              builder: (context, userState) {
                                final List<User> usersList = userState
                                    .maybeWhen(
                                      loaded: (users) => users,
                                      orElse: () => [],
                                    );

                                return CustomDropdownFormField<String>(
                                  text: appLocalizations.sales,
                                  labelText: userState.maybeWhen(
                                    loading: () => appLocalizations.loading,
                                    orElse: () =>
                                        appLocalizations.selectSalesName,
                                  ),

                                  // Disable dropdown while loading
                                  onChanged: (userState is Loading)
                                      ? null
                                      : (val) {
                                          cubit.assignedToId = val ?? '';
                                        },
                                  value: cubit.assignedToId,
                                  items: usersList.map((user) {
                                    return DropdownMenuItem<String>(
                                      value: user.userId,
                                      child: Text(
                                        user.fullName!,
                                        style: TextStyle(
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              },
                            ),
                            const SizedBox(height: 10),

                            CustomTextFormField(
                              labelText: 'Expiration Date (YYYY-MM-DD)',
                              controller: cubit.expirationDateController,
                              iconData: Icons.calendar_today,
                              onTap: () async {
                                DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100),
                                );
                                if (picked != null) {
                                  cubit.expirationDateController.text = picked
                                      .toUtc()
                                      .toIso8601String();
                                }
                              },
                            ),
                            const SizedBox(height: 10),

                            CustomTextFormField(
                              labelText: 'Task Description',
                              controller: cubit.descriptionController,
                              maxLines: 3,
                            ),
                            const SizedBox(height: 16),

                            BlocBuilder<AddTaskCubit, AddTaskState>(
                              builder: (context, state) {
                                return CustomButton(
                                  text: state is AddTaskLoading
                                      ? "Saving..."
                                      : "Save",
                                  onPressed: () => cubit.emitAddTask(),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDarkMode) {
    return Row(
      children: [
        const Icon(Icons.task_alt),
        const SizedBox(width: 8),
        Text(
          'Create New Task',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildDateRow(bool isDarkMode) {
    return Row(
      children: [
        const Icon(Icons.calendar_month_outlined),
        const SizedBox(width: 8),
        Text(
          "Creation date",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isDarkMode ? Colors.white : secondaryTextColor,
          ),
        ),
        const Spacer(),
        Text(
          DateTime.now().toString().split(' ')[0],
          style: TextStyle(
            color: isDarkMode ? Colors.white : secondaryTextColor,
          ),
        ),
      ],
    );
  }
}
