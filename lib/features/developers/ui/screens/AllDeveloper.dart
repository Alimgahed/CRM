import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/features/developers/ui/widgets/AllDeveloper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllDevelopers extends StatelessWidget {
  const AllDevelopers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ReusableHeader(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Developers Companies".tr,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SearchBarWidget(
                  prefixIcon: Icons.search,
                  suffixIcon: Icons.filter_list,
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(0.0),
              itemBuilder: (context, index) {
                return const Alldeveloper_widget();
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
