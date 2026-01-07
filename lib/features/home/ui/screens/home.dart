import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/services/user_service.dart';
import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/features/home/ui/widgets/Clients.dart';
import 'package:crm/features/home/ui/widgets/Sales_performance_stages.dart';
import 'package:crm/features/home/ui/widgets/Users.dart';
import 'package:crm/features/home/ui/widgets/header.dart';
import 'package:crm/features/home/ui/widgets/totals.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final userService = getIt<UserService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReusableHeader(
              height: 140,
              child: buildHeader(
                context,
                userService.currentUser?.fullName ?? '',
              ),
            ),
            SizedBox(
              height: 300, // Space for the overlapping search bar
              child: TotalsSection(),
            ),
            const SizedBox(height: 340, child: SalesPerformanceStages()),
            const SizedBox(height: 430, child: Clients()),
            const SizedBox(height: 430, child: Users()),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
