import 'package:crm/constant/colors.dart';
import 'package:crm/my_widget/Property_widget/Gloable_widget.dart';
import 'package:flutter/material.dart';

class UserManagementWidget extends StatelessWidget {
  const UserManagementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(12), // better spacing performance
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Row
            Row(
              children: const [
                Text("علي محمد احمد"),
                Spacer(),
                Icon(Icons.more_horiz, color: Colors.black),
              ],
            ),

            const SizedBox(height: 12),

            /// Email + Phone Row
            Row(
              children: [
                infoChip(
                  Icons.person_outline_outlined,
                  'Admin',
                  secondaryTextColor,
                ),
                const SizedBox(width: 10),
                infoChip(Icons.mobile_friendly, '٢ جهاز ', secondaryTextColor),
                const SizedBox(width: 10),
                Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ), // centers better
                  child: Center(
                    child: DropdownMenu<String>(
                      initialSelection: "active",
                      textStyle: const TextStyle(
                        color: Colors.green,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),

                      // Makes the arrow green
                      trailingIcon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.green,
                        size: 18,
                      ),

                      inputDecorationTheme: const InputDecorationTheme(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.zero, // fixes vertical centering
                      ),

                      menuStyle: MenuStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Colors.white,
                        ),
                      ),

                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: 'active', label: 'Active'),
                        DropdownMenuEntry(value: 'inactive', label: 'Inactive'),
                      ],
                      onSelected: (value) {},
                    ),
                  ),
                ),
              ],
            ),

            /// Buttons Row
          ],
        ),
      ),
    );
  }
}
