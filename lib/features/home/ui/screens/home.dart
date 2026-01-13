import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/services/user_service.dart';
import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/features/home/ui/widgets/clients_widget/Clients.dart';
import 'package:crm/features/home/ui/widgets/Sales_performance_stages.dart';
import 'package:crm/features/home/ui/widgets/Users.dart';
import 'package:crm/features/home/ui/widgets/header.dart';
import 'package:crm/features/home/ui/widgets/totals.dart';
import 'package:crm/features/statistics/logic/statistics_cubit.dart';
import 'package:crm/features/statistics/logic/statistics_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = getIt<UserService>();

    return SingleChildScrollView(
      child: BlocBuilder<StatisticsCubit, StatisticsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(height: 340),
            loading: () => Center(child: CircularProgressIndicator()),
            loaded: (data) => Column(
              children: [
                ReusableHeader(
                  height: 140,
                  child: buildHeader(
                    context,
                    userService.currentUser?.fullName ?? '',
                  ),
                ),

                SizedBox(
                  height: 220.h,
                  child: TotalsSection(data: data),
                ),
                SizedBox(
                  height: 820.h,
                  child: SalesPerformanceStages(data: data),
                ),

                SizedBox(
                  height: 750.h,
                  child: Clients(leads: data.data.lastTenLeads),
                ),
                const SizedBox(height: 430, child: Users()),
                const SizedBox(height: 100),
              ],
            ),
            error: (msg) =>
                SizedBox(height: 340, child: Center(child: Text(msg))),
          );
        },
      ),
    );
  }
}
