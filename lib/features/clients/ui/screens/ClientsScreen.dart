import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/features/clients/data/model/leads_model.dart';
import 'package:crm/features/clients/logic/all_clients/Clients_controller.dart';
import 'package:crm/features/clients/logic/cubit/filiter_cubit.dart';
import 'package:crm/features/clients/logic/cubit/leads_cubit.dart';
import 'package:crm/features/clients/logic/states/leads_states.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LeadsCubit>()..fetchAllLeads()),
        BlocProvider(create: (context) => FiliterCubit()),
      ],
      child: Scaffold(
        body: BlocBuilder<LeadsCubit, LeadsState>(
          builder: (context, state) {
            return state.when(
              initial: () => Center(child: Text(appLocalizations.noData)),
              loading: () => const ClientsListShimmer(),
              error: (message) => Center(
                child: Text(message, style: const TextStyle(color: Colors.red)),
              ),
              loaded: (lead) => ClientsContent(lead: lead),
            );
          },
        ),
      ),
    );
  }
}

class ClientsContent extends StatelessWidget {
  const ClientsContent({super.key, required this.lead});

  final List<Lead> lead;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClientsHeader(),
        SizedBox(height: 8),
        ClientsFilterSection(),
        SizedBox(height: 8),
        Expanded(
          child: ClientsListScreen(lead: lead), // or ClientsListScreen
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
