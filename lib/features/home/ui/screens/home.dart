import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/services/user_service.dart';
import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/features/home/ui/widgets/clients_widget/Clients.dart';
import 'package:crm/features/home/ui/widgets/Sales_performance_stages.dart';
import 'package:crm/features/home/ui/widgets/header.dart';
import 'package:crm/features/home/ui/widgets/loading.dart';
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
    // Moved outside build or used via context.read to avoid repeated DI lookups
    final userName = getIt<UserService>().currentUser?.fullName ?? '';

    return RefreshIndicator(
      onRefresh: () => context.read<StatisticsCubit>().getStatistics(),
      child: SingleChildScrollView(
        physics:
            const AlwaysScrollableScrollPhysics(), // Allows pull-to-refresh
        child: Column(
          children: [
            // Header is usually static or has its own logic, move outside the main data builder
            ReusableHeader(
              height: 190.h,
              child: HeaderWidget(userName: userName),
            ),

            BlocBuilder<StatisticsCubit, StatisticsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () =>
                      HomeShimmerLoading(), // Use Shimmers instead of Spinner
                  loaded: (data) => Column(
                    children: [
                      TotalsSection(data: data),

                      SalesPerformanceStages(data: data),

                      Clients(leads: data.data.lastTenLeads),

                      // const Users(),
                      heightSpace(100),
                    ],
                  ),
                  error: (msg) => Center(child: Text(msg)),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
