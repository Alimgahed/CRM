import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/features/clients/logic/all_clients/Clients_controller.dart';
import 'package:crm/features/clients/logic/cubit/filiter_cubit.dart';
import 'package:crm/features/clients/logic/cubit/leads_cubit.dart';
import 'package:crm/features/clients/logic/cubit/leads_states.dart';
import 'package:crm/features/clients/ui/widgets/ClientCard.dart';
import 'package:crm/features/clients/ui/widgets/ClientsFiliter.dart';
import 'package:crm/features/clients/ui/widgets/Header.dart';
import 'package:crm/features/clients/ui/widgets/clients_loading.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ClientsController(), permanent: true);

    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    return BlocProvider(
      create: (context) => getIt<LeadsCubit>()..fetchAllLeads(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<LeadsCubit, LeadsState>(
            builder: (context, state) {
              return state.when(
                initial: () => Center(
                  child: Text(
                    appLocalizations.noData,
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
                loading: () => const ClientsListShimmer(),
                loaded: (leads) => Column(
                  children: [
                    ClientsHeader(),
                    BlocProvider(
                      create: (context) => FiliterCubit(),
                      child: ClientsFilterSection(),
                    ),
                    ClientsListScreen(lead: leads),
                    const SizedBox(height: 50),
                  ],
                ),
                error: (message) => Center(
                  child: Text(message, style: TextStyle(color: Colors.red)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
