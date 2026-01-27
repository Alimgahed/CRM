import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/features/Units/data/models/unit_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/owners/logic/cubit/owner_cubit.dart';
import 'package:crm/features/owners/logic/states/owner_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OwnerInfo extends StatelessWidget {
  final Unit unit;

  const OwnerInfo({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return buildCard(
      child: BlocBuilder<OwnerCubit, OwnerState>(
        builder: (context, state) {
          // 1. Handle different states properly
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Text("Error: $message"),
            loaded: (ownersList) {
              // 2. Find the owner safely using firstWhereOrNull
              final owner = ownersList.firstWhere(
                (element) => element.id == unit.ownerId,
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSectionTitle(appLocalizations.owner),
                  const SizedBox(height: itemSpacing),

                  buildInfoRow(
                    appLocalizations.company,
                    unit.companyId?.toString() ?? '-',
                  ),

                  // 3. Display found name or a fallback string
                  buildInfoRow(
                    appLocalizations.owner,
                    owner.fullName ?? appLocalizations.notAssigned,
                  ),
                ],
              );
            },
            // Fallback for initial or empty state
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
