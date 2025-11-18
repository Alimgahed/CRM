import 'package:crm/constant/colors.dart';
import 'package:flutter/material.dart';

class MoreWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  const MoreWidget({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        color: Colors.white,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.black),
            ),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: secondaryTextColor,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 16,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 20, color: secondaryTextColor),
          ],
        ),
      ),
    );
  }
}
