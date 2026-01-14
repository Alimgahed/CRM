import 'package:crm/Core/theming/Colors.dart';
import 'package:crm/Core/widgets/fields.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/actions/logic/add_client.dart';
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
      create: (context) => AddClientCubit(),
      child: BlocBuilder<AddClientCubit, void>(
        builder: (context, _) {
          final cubit = context.read<AddClientCubit>();

          return SingleChildScrollView(
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

                      CustomTextFormField(
                        text: appLocalizations.clientName,
                        labelText: appLocalizations.enterClientNameHere,
                        controller: cubit.clientNameController,
                      ),
                      const SizedBox(height: 10),

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
                          DropdownMenuItem(value: 'high', child: Text('High')),
                        ],
                        onChanged: (val) {
                          cubit.taskPriority = val ?? '';
                          cubit.rebuild();
                        },
                      ),
                      const SizedBox(height: 10),

                      CountryPhoneField(
                        hintText: appLocalizations.writePhoneNumber,
                        country: appLocalizations.selectCountry,
                        phoneController: cubit.phoneController,
                      ),
                      const SizedBox(height: 10),

                      CountryPhoneField(
                        hintText: appLocalizations.writeOtherPhoneNumber,
                        country: appLocalizations.selectCountry,
                        phoneController: cubit.phoneController2,
                      ),
                      const SizedBox(height: 10),

                      CustomTextFormField(
                        text: appLocalizations.jobTitle,
                        labelText: appLocalizations.writeJob,
                        controller: cubit.taskDescriptionController,
                      ),
                      const SizedBox(height: 10),

                      CustomTextFormField(
                        text: appLocalizations.email,
                        labelText: appLocalizations.writeEmail,
                        controller: cubit.emailController,
                      ),
                      const SizedBox(height: 10),

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
                        ],
                        onChanged: (val) {
                          cubit.channel = val ?? '';
                          cubit.rebuild();
                        },
                      ),
                      const SizedBox(height: 10),

                      CustomDropdownFormField<String>(
                        text: appLocalizations.preferredMethodOfContact,
                        labelText:
                            appLocalizations.selectPreferredMethodOfContact,
                        value: cubit.preferredMethod.isEmpty
                            ? null
                            : cubit.preferredMethod,
                        items: [
                          DropdownMenuItem(
                            value: appLocalizations.email,
                            child: Text(appLocalizations.email),
                          ),
                          DropdownMenuItem(
                            value: appLocalizations.phone,
                            child: Text(appLocalizations.phone),
                          ),
                        ],
                        onChanged: (val) {
                          cubit.preferredMethod = val ?? '';
                          cubit.rebuild();
                        },
                      ),
                      SizedBox(height: 10),

                      CustomDropdownFormField<String>(
                        text: appLocalizations.clientStatus,
                        labelText: appLocalizations.selectClientStatus,
                        value: cubit.clientStatus.isEmpty
                            ? null
                            : cubit.clientStatus,
                        items: [
                          DropdownMenuItem(
                            value: appLocalizations.active,
                            child: Text(appLocalizations.active),
                          ),
                          DropdownMenuItem(
                            value: appLocalizations.inactive,
                            child: Text(appLocalizations.inactive),
                          ),
                        ],
                        onChanged: (val) {
                          cubit.clientStatus = val ?? '';
                          cubit.rebuild();
                        },
                      ),

                      const SizedBox(height: 20),

                      CustomButton(
                        text: appLocalizations.save,
                        onPressed: () => cubit.saveTask(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
