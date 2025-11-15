import 'package:crm/constant/Icons.dart';
import 'package:crm/constant/colors.dart';
import 'package:crm/controller/Features/Communcation.dart';
import 'package:crm/gloable/buttons.dart';
import 'package:crm/view/Clients/Clients_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsListScreen extends StatelessWidget {
  const ClientsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller once at the parent level
    final commController = Get.put(CommuncationController(), permanent: true);

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: 5,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ClientCard(
          name: 'أحمد خالد علي',
          phone: '0123456789',
          date: '2023-10-10  12:30 PM',
          project: 'إمكان',
          channel: 'Facebook',
          status: 'New',
          onCall: () => commController.makePhoneCall('+123456789'),
          onWhatsapp: () => commController.whatsapp(phone: '+123456789'),
        );
      },
    );
  }
}

class ClientCard extends StatelessWidget {
  final String name;
  final String phone;
  final String date;
  final String project;
  final String channel;
  final String status;
  final VoidCallback onCall;
  final VoidCallback onWhatsapp;

  const ClientCard({
    super.key,
    required this.name,
    required this.phone,
    required this.date,
    required this.project,
    required this.channel,
    required this.status,
    required this.onCall,
    required this.onWhatsapp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header (name + menu)
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz_outlined,
                  color: secondaryTextColor,
                  size: 25,
                ),
              ),
            ],
          ),

          // Phone
          const SizedBox(height: 4),
          InfoRow(icon: Icons.phone_outlined, text: phone),

          // Date
          const SizedBox(height: 4),
          InfoRow(icon: Icons.calendar_month_outlined, text: date),

          const SizedBox(height: 8),

          // Project, Channel, Status
          Row(
            children: [
              Tag(icon: Icons.business_sharp, text: project),
              const SizedBox(width: 10),
              Tag(icon: Icons.facebook_outlined, text: channel),
              const Spacer(),
              StatusTag(status: status),
            ],
          ),

          const SizedBox(height: 10),

          // Buttons Row
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  height: 40,
                  text: "Show Details".tr,
                  onPressed: () {
                    Get.bottomSheet(
                      FractionallySizedBox(
                        // heightFactor: 0.8, // 👈 controls height (80% of screen)
                        child: const ClientsDetails(),
                      ),
                      isScrollControlled:
                          true, // Makes it full height if needed
                      backgroundColor: Colors.transparent,
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              _ActionButton(icon: Icons.call_outlined, onTap: onCall),
              const SizedBox(width: 10),
              _ActionButton(icon: MyFlutterApp.whatsapp, onTap: onWhatsapp),
            ],
          ),
        ],
      ),
    );
  }
}

// Small, efficient reusable UI widgets
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: secondaryTextColor),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(color: secondaryTextColor)),
      ],
    );
  }
}

class Tag extends StatelessWidget {
  final IconData icon;
  final String text;
  const Tag({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: divColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 16, color: secondaryTextColor),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(fontSize: 12, color: secondaryTextColor),
          ),
        ],
      ),
    );
  }
}

class StatusTag extends StatelessWidget {
  final String status;
  const StatusTag({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final color = Colors.yellow.shade600;
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow.shade100,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Text(status.tr, style: TextStyle(color: color, fontSize: 12)),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ActionButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: appColor),
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: appColor),
      ),
    );
  }
}
