import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/features/commision/ui/widgets/AllCommisions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCommisions extends StatelessWidget {
  const AllCommisions({super.key});

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
                    Text("Commisions".tr, style: const TextStyle(fontSize: 18)),
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
                return const AllCommisionsWidget();
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
