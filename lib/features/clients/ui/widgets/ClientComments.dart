import 'package:crm/Core/theming/colors.dart';
import 'package:flutter/material.dart';

class Clientcomments extends StatelessWidget {
  const Clientcomments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: SizedBox(
        height: 400,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ClientInfo(
                label: "محمد احمد علي",
                value: "لم يقم بالرد في مكالمة المتابعة.",
              ),
            );
          },
          itemCount: 5,
        ),
      ),
    );
  }
}

class ClientInfo extends StatelessWidget {
  final String label;
  final String value;

  const ClientInfo({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade200,
              child: const Icon(Icons.person, color: Colors.grey),
            ),
            const SizedBox(width: 12),
            Text(
              "محمد احمد علي",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 0,
                color: secondaryTextColor,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "منذ 5 دقائق",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 0,
                color: secondaryTextColor,
              ),
            ),

            // Label
          ],
        ),
        SizedBox(height: 10),
        Text(
          "لم يقم بالرد في مكالمة المتابعة.",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 16,

            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}
