import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/helpers/extesions.dart';
import 'package:crm/Core/theming/Colors.dart';
import 'package:crm/Core/widgets/fields.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/actions/logic/add_client.dart';
import 'package:crm/features/actions/logic/add_client_state.dart';
import 'package:crm/features/actions/data/repo/add_client_repo.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/logic/Features/Country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddClient extends StatelessWidget {
  const AddClient({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return BlocProvider(
      create: (context) =>
          AddClientCubit(addClientRepo: getIt.get<AddClientRepo>()),
      child: BlocConsumer<AddClientCubit, AddClientState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              // Show loading dialog
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => Center(
                  child: CircularProgressIndicator(
                    color: isDark ? Colors.white : Colors.blue,
                  ),
                ),
              );
            },
            error: (message) {
              // Dismiss loading dialog first
              Navigator.of(context).pop();

              // Show error dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: isDark
                      ? const Color(0xFF1E1E1E)
                      : Colors.white,
                  title: Text(
                    appLocalizations.error,
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  content: Text(
                    message,
                    style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black87,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(appLocalizations.ok),
                    ),
                  ],
                ),
              );
            },
            loaded: (loginresponse) {
              // Dismiss loading dialog first
              context.pop();

              // Show success dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: isDark
                      ? const Color(0xFF1E1E1E)
                      : Colors.white,
                  title: Text(
                    appLocalizations.success,
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  content: Text(
                    appLocalizations.success,
                    style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black87,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close success dialog
                        Navigator.of(context).pop(); // Close add client sheet
                      },
                      child: Text(appLocalizations.ok),
                    ),
                  ],
                ),
              );
            },
          );
        },
        builder: (context, state) {
          final cubit = context.read<AddClientCubit>();
          final isLoading = state is AddClientStateLoading;

          return Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const FloatingCloseButton(),

                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: isDark ? darkColor : Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person_add, color: appColor),
                            const SizedBox(width: 8),
                            Text(
                              appLocalizations.createNewClient,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: appColor,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Client Name (Arabic/Default)
                        CustomTextFormField(
                          text: appLocalizations.clientName,
                          labelText: appLocalizations.enterClientNameHere,
                          controller: cubit.clientNameController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Client name is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),

                        // Client Name (English)
                        CustomTextFormField(
                          text: 'Client Name (English)',
                          labelText: 'Enter client name in English',
                          controller: cubit.clientNameEnController,
                        ),
                        const SizedBox(height: 10),

                        // Project Priority
                        CustomDropdownFormField<String>(
                          text: appLocalizations.project,
                          labelText: appLocalizations.selectProject,
                          value: cubit.taskPriority.isEmpty
                              ? null
                              : cubit.taskPriority,
                          items: const [
                            DropdownMenuItem(value: 'low', child: Text('Low')),
                            DropdownMenuItem(
                              value: 'medium',
                              child: Text('Medium'),
                            ),
                            DropdownMenuItem(
                              value: 'high',
                              child: Text('High'),
                            ),
                          ],
                          onChanged: isLoading
                              ? null
                              : (val) {
                                  cubit.updateTaskPriority(val ?? '');
                                },
                        ),
                        const SizedBox(height: 10),

                        // Primary Phone
                        CountryPhoneField(
                          hintText: appLocalizations.writePhoneNumber,
                          country: appLocalizations.selectCountry,
                          phoneController: cubit.phoneController,
                        ),
                        const SizedBox(height: 10),

                        // Secondary Phone (Optional)
                        CountryPhoneField(
                          hintText: appLocalizations.writeOtherPhoneNumber,
                          country: appLocalizations.selectCountry,
                          phoneController: cubit.phoneController2,
                        ),
                        const SizedBox(height: 10),

                        // Job Title
                        CustomTextFormField(
                          text: appLocalizations.jobTitle,
                          labelText: appLocalizations.writeJob,
                          controller: cubit.taskDescriptionController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Job title is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),

                        // Email
                        CustomTextFormField(
                          text: appLocalizations.email,
                          labelText: appLocalizations.writeEmail,
                          controller: cubit.emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Email is required';
                            }
                            if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),

                        // Budget
                        CustomTextFormField(
                          text: appLocalizations.budget,
                          labelText: appLocalizations.budget,
                          controller: cubit.budgetController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value != null && value.trim().isNotEmpty) {
                              if (int.tryParse(value.trim()) == null) {
                                return 'Please enter a valid number';
                              }
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),

                        // Channel
                        CustomDropdownFormField<String>(
                          text: appLocalizations.channel,
                          labelText: appLocalizations.selectChannel,
                          value: cubit.channel.isEmpty ? null : cubit.channel,
                          items: const [
                            DropdownMenuItem(
                              value: 'social',
                              child: Text('Social Media'),
                            ),
                            DropdownMenuItem(
                              value: 'referral',
                              child: Text('Referral'),
                            ),
                            DropdownMenuItem(
                              value: 'website',
                              child: Text('Website'),
                            ),
                            DropdownMenuItem(
                              value: 'direct',
                              child: Text('Direct'),
                            ),
                          ],
                          onChanged: isLoading
                              ? null
                              : (val) {
                                  cubit.updateChannel(val ?? '');
                                },
                        ),
                        const SizedBox(height: 10),

                        // Preferred Contact Method
                        CustomDropdownFormField<String>(
                          text: appLocalizations.preferredMethodOfContact,
                          labelText:
                              appLocalizations.selectPreferredMethodOfContact,
                          value: cubit.preferredMethod.isEmpty
                              ? null
                              : cubit.preferredMethod,
                          items: [
                            DropdownMenuItem(
                              value: 'email',
                              child: Text(appLocalizations.email),
                            ),
                            DropdownMenuItem(
                              value: 'phone',
                              child: Text(appLocalizations.phone),
                            ),
                            DropdownMenuItem(
                              value: 'whatsapp',
                              child: Text('WhatsApp'),
                            ),
                          ],
                          onChanged: isLoading
                              ? null
                              : (val) {
                                  cubit.updatePreferredMethod(val ?? '');
                                },
                        ),
                        const SizedBox(height: 10),

                        // Client Status
                        CustomDropdownFormField<String>(
                          text: appLocalizations.clientStatus,
                          labelText: appLocalizations.selectClientStatus,
                          value: cubit.clientStatus.isEmpty
                              ? null
                              : cubit.clientStatus,
                          items: [
                            DropdownMenuItem(
                              value: 'active',
                              child: Text(appLocalizations.active),
                            ),
                            DropdownMenuItem(
                              value: 'inactive',
                              child: Text(appLocalizations.inactive),
                            ),
                          ],
                          onChanged: isLoading
                              ? null
                              : (val) {
                                  cubit.updateClientStatus(val ?? '');
                                },
                        ),

                        const SizedBox(height: 20),

                        // Save Button
                        CustomButton(
                          text: appLocalizations.save,
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {
                              cubit.addClient(context);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
