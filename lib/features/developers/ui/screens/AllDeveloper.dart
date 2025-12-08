import 'package:crm/Core/widgets/gloable.dart';

import 'package:crm/features/developers/logic/cubit/developer_cubit.dart';
import 'package:crm/features/developers/logic/cubit/developer_states.dart';
import 'package:crm/features/developers/ui/widgets/AllDeveloper.dart';
import 'package:crm/features/developers/ui/widgets/developers_looading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AllDevelopers extends StatelessWidget {
  const AllDevelopers({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ReusableHeader(title: 'Developers'.tr),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SearchBarWidget(
              prefixIcon: Icons.search,
              suffixIcon: Icons.filter_list,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<DeveloperCubit, DeveloperStates>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(child: Text("No Data")),
                  // <-- بدل CircularProgressIndicator نستخدم Shimmer
                  loading: () => ListView.builder(
                    itemCount: 5, // عدد العناصر التي يظهر فيها Shimmer
                    itemBuilder: (_, __) => const AllDeveloperShimmerWidget(),
                  ),
                  loaded: (developers) => ListView.builder(
                    itemCount: developers.length,
                    itemBuilder: (_, index) {
                      return AllDeveloperWidget(developer: developers[index]);
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
