import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/features/Projects/ui/widgets/all_project_loadding.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/owners/logic/cubit/owner_cubit.dart';
import 'package:crm/features/owners/logic/states/owner_states.dart';
import 'package:crm/features/owners/ui/widgets/AllOwnerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AllOwners extends StatelessWidget {
  const AllOwners({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: Text('Owners'.tr)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBarWidget(
              prefixIcon: Icons.search,
              suffixIcon: Icons.filter_list,
            ),
          ),
          Expanded(
            child: BlocBuilder<OwnerCubit, OwnerState>(
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
                  loaded: (owner) => owner.isEmpty
                      ? Center(
                          child: Text(
                            appLocalizations.noData,
                            style: TextStyle(
                              color: isDark ? Colors.white70 : darkColor,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: owner.length,
                          itemBuilder: (_, index) {
                            return AllOwnerWidget(owner: owner[index]);
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
