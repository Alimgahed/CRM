import 'package:crm/constant/colors.dart';
import 'package:crm/controller/Clients/Clients_controller.dart';
import 'package:crm/gloable/Reusable_widget/buttons.dart';
import 'package:crm/my_widget/Clients_widget/ClienTtimeLine.dart';
import 'package:crm/my_widget/Clients_widget/ClientCard.dart';
import 'package:crm/my_widget/Clients_widget/ClientChance.dart';
import 'package:crm/my_widget/Clients_widget/ClientCli.dart';
import 'package:crm/my_widget/Clients_widget/ClientComments.dart';
import 'package:crm/my_widget/Clients_widget/ClientDeals.dart';
import 'package:crm/my_widget/Clients_widget/Clientattachment.dart';
import 'package:crm/my_widget/Clients_widget/Clientmore.dart';
import 'package:crm/my_widget/Clients_widget/ClientsFiliter.dart';
import 'package:crm/my_widget/Clients_widget/Clientsdetails.dart';
import 'package:crm/view/actions/add_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsDetails extends StatelessWidget {
  const ClientsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ClientsController>();

    final List<Map<String, dynamic>> actionButtons = [
      {
        'icon': Icons.remove_red_eye_outlined,
        'index': 18,
        'onTap': () => controller.selectedFilter.value = 18,
      },
      {
        'icon': Icons.add_box,
        'index': 28,
        'onTap': () {
          controller.selectedFilter.value = 28;
          Get.bottomSheet(
            FractionallySizedBox(
              heightFactor: 0.8, // 👈 controls height (80% of screen)
              child: const AddClient(),
            ),

            isScrollControlled: true, // Makes it full height if needed
            backgroundColor: Colors.transparent,
          );
        },
      },
      {
        'icon': Icons.edit_outlined,
        'index': 29,
        'onTap': () {
          print("Edit client clicked");
          // Open edit client screen/modal
        },
      },
      {
        'icon': Icons.people_alt_outlined,
        'index': 30,
        'onTap': () {
          // Show client contacts
        },
      },
      {
        'icon': Icons.more_vert_outlined,
        'index': 31,
        'onTap': () {
          controller.selectedFilter.value = 31;
          Get.bottomSheet(
            FractionallySizedBox(child: const Clientmore()),
            isScrollControlled: true, // Makes it full height if needed
            backgroundColor: Colors.transparent,
          );

          // Open more options menu
        },
      },
    ];

    final List<dynamic> filters = [
      {'index': 17, 'icon': Icons.now_widgets_outlined},
      {'index': 18, 'label': "Details".tr},
      {'index': 19, 'label': "Comments".tr},
      {'index': 20, 'label': "Attachments".tr},
      {'index': 21, 'label': "Timeline".tr},
      {'index': 22, 'label': "Deals".tr},
      {'index': 23, 'label': "Chances".tr},
      {'index': 24, 'label': "Cli Request".tr},
      {'index': 25, 'label': "Contracts".tr},
      {'index': 26, 'label': "Payment Plan".tr},
      {'index': 27, 'label': "Check In".tr},
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          const FloatingCloseButton(),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    const Icon(Icons.contact_emergency_outlined),
                    const SizedBox(width: 8),
                    Text(
                      'Client Details'.tr,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Action Buttons
                Wrap(
                  spacing: 8,
                  children: actionButtons
                      .map(
                        (btn) => _ActionIconButton(
                          icon: btn['icon'],
                          onTap: btn['onTap'],
                          index: btn['index'],
                        ),
                      )
                      .toList(),
                ),

                const SizedBox(height: 15),

                // Info
                const InfoRow(icon: Icons.phone_outlined, text: "010123456789"),
                const SizedBox(height: 10),
                const InfoRow(
                  icon: Icons.calendar_month_outlined,
                  text: "12/10/2023 - 10:00 AM",
                ),
                const SizedBox(height: 10),

                // Tags and Status
                Row(
                  children: const [
                    Tag(icon: Icons.business_sharp, text: "امكان"),
                    SizedBox(width: 10),
                    Tag(icon: Icons.facebook_outlined, text: "Facebook"),
                    Spacer(),
                    StatusTag(status: "جديد"),
                  ],
                ),
                const SizedBox(height: 20),

                // Filter Buttons (Horizontal Scroll)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: filters.map((filter) {
                        if (filter.containsKey('icon')) {
                          return Row(
                            children: [
                              FilterButton(
                                index: filter['index'],
                                icon: filter['icon'],
                              ),
                              const SizedBox(width: 8),
                            ],
                          );
                        }
                        return Row(
                          children: [
                            FilterButton(
                              index: filter['index'],
                              label: filter['label'],
                            ),
                            const SizedBox(width: 8),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Obx(() {
                  if (controller.selectedFilter.value == 18) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: DetailsWidget(),
                    );
                  }
                  return const SizedBox.shrink();
                }),
                Obx(() {
                  if (controller.selectedFilter.value == 19) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Clientcomments(),
                    );
                  }
                  return const SizedBox.shrink();
                }),
                Obx(() {
                  if (controller.selectedFilter.value == 21) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: ClientTimeline(),
                    );
                  }
                  return const SizedBox.shrink();
                }),
                Obx(() {
                  if (controller.selectedFilter.value == 20) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: ClientAttachment(),
                    );
                  }
                  return const SizedBox.shrink();
                }),
                Obx(() {
                  if (controller.selectedFilter.value == 22) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ClientDeals(),
                    );
                  }
                  return const SizedBox.shrink();
                }),
                Obx(() {
                  if (controller.selectedFilter.value == 23) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Clientchance(),
                    );
                  }
                  return const SizedBox.shrink();
                }),
                Obx(() {
                  if (controller.selectedFilter.value == 24) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Clientcli(),
                    );
                  }
                  return const SizedBox.shrink();
                }),
                Obx(() {
                  if (controller.selectedFilter.value == 25) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ClientAttachment(),
                    );
                  }
                  return const SizedBox.shrink();
                }),

                Obx(() {
                  if (controller.selectedFilter.value == 100) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: ClientDealsList(
                        deals: [
                          ClientDeal(
                            unitNumber: 'وحدة#1',
                            projectInfo: 'مشروع النخيل - شقة - 120 م²',
                            totalPrice: '500,000 جنيه',
                            status: 'مباع',
                          ),
                          ClientDeal(
                            unitNumber: 'وحدة#2',
                            projectInfo: 'مشروع النخيل - فيلا - 200 م²',
                            totalPrice: '1,200,000 جنيه',
                            status: 'متاحة',
                          ),
                          ClientDeal(
                            unitNumber: 'وحدة#3',
                            projectInfo: 'مشروع الواحة - شقة - 90 م²',
                            totalPrice: '350,000 جنيه',
                            status: 'محجوزة',
                          ),
                          ClientDeal(
                            unitNumber: 'وحدة#4',
                            projectInfo: 'مشروع الواحة - فيلا - 180 م²',
                            totalPrice: '1,000,000 جنيه',
                            status: 'مباع',
                          ),
                          ClientDeal(
                            unitNumber: 'وحدة#5',
                            projectInfo: 'مشروع النخيل - شقة - 110 م²',
                            totalPrice: '480,000 جنيه',
                            status: 'متاحة',
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final int? index;

  const _ActionIconButton({
    required this.icon,
    required this.onTap,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ClientsController>();

    return Obx(() {
      final bool selected =
          index != null && controller.selectedFilter.value == index;
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 55,
          height: 40,
          decoration: BoxDecoration(
            color: selected ? appColor : Colors.white,
            border: Border.all(color: appColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(icon, color: selected ? Colors.white : appColor),
          ),
        ),
      );
    });
  }
}
